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

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(strong_params)
    @post.author = @user

    if @post.save
      flash[:success] = 'Post saved!'
      redirect_to user_path(@user.id)

    else
      flash.now[:error] = 'Please fill all fields'
      render :new, status: 422
    end
  end

  private

  def strong_params
    params.require(:post).permit(:title, :text, :likesCounter[0], :comments_counter[0])
  end
end
