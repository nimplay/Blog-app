class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @post = Post.where(authorId: @user.id)
    @comment = Comment.where(postId: @post.ids)
  end

  def show

    @user = User.find(params[:id])
    @post = Post.find(params[:id])
  end
end
