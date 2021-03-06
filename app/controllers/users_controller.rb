class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @blogs = current_user.blogs
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
  
end
