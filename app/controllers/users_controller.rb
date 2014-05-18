class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if User.signup(params[:name], params[:password])
      redirect_to new_sessions_path
    else
      @user = User.new
      @user.name = params[:name]
      @user.valid?
      render 'new'
    end
  end
end