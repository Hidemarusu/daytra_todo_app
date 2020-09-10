class TasksController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_url
    else
      render 'tasks/new'
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_url, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render 'tasks/edit'
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: '削除に成功しました'
  end

  private
    def task_params
      params.require(:task).permit(:title, :content)
    end
end