class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    
    if @user.save
      render 'users/create'
    end
  end

  private

  def user_params
    params.required(:user).permit(:username, :email, :password)
  end
end
