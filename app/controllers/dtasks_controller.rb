class DtasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @dtasks = Dtask.all
  end

  def show
    @dtask = Dtask.find(params[:id])
  end

  def new
    @dtask = current_user.dtasks.build
  end

  def create
    @dtask = current_user.dtasks.build(dtask_params)
    if @dtask.save
      redirect_to tasks_url
    else
      render 'dtasks/new'
    end
  end

  def edit
    @dtask = current_user.dtasks.find(params[:id])
  end

  def update
    @dtask = current_user.tasks.find(params[:id])
    if @dtask.update(dtask_params)
      redirect_to dtasks_url, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render 'tasks/edit'
    end
  end

  def destroy
    @task = current_user.dtasks.find(params[:id])
    @dtask.destroy
    redirect_to dtasks_url, notice: '削除に成功しました'
  end

  private
  def dtask_params
    params.require(:dtask).permit(:title, :content)
  end
end
