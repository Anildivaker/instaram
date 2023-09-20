class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.present?
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to posts_url
      else
        flash[:alert] = "Email and password are incorrect"
        render :new, status: 422
      end
    else
      flash[:alert] = "User Not Found"
      render :new, status: 404
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to sign_in_path
  end

end
