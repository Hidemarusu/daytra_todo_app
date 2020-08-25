class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
  end
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました" 
      tasks_url  #　指定したいパスに変更
    else
      flash[:notice] = "新規登録完了しました。次に名前を入力してください" 
      new_profile_path  #　指定したいパスに変更
    end
  end
end