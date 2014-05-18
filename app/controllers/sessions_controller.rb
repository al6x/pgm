class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user = User.signin(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      @user = User.new
      @user.name = params[:name]
      @user.valid?
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
