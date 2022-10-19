class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.where(authorId: @user.id)
  end

  def new
    @user = User.new
  end
end
