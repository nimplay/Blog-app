class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  @users = User.all
  @current = current_user
  end

  def show
    @user = current_user
    # @user = User.find(params[:id])
    @post = Post.where(authorId: @user.id)
  end

end
