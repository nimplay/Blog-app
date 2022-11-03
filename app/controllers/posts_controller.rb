class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @post = Post.where(authorId: @user.id)
    @comment = Comment.where(postId: @post.ids)
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find_by(authorId: current_user.id, id: params[:post_id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(strong_params)
    @post.author = @user
    @post.likesCounter = 0
    @post.commentsCounter = 0

    if @post.save
      flash[:success] = 'Post saved!'
      redirect_to user_path(@user.id)

    else
      flash.now[:error] = 'Please fill all fields'
      render :new, status: 422
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy

    redirect_to user_path(params[:id])
  end

  private

  def strong_params
    params.require(:post).permit(:title, :text)
  end
end
