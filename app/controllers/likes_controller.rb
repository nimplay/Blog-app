class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    author = current_user
    like = Like.new(params.permit(:author, :post))
    like.authorId = author.id
    like.post = post
    if like.save
      flash[:success] = 'You gave a like to this post!'
      redirect_to post_url(author, post)
    else
      flash.now[:error] = 'Error: Your like was not saved!'
    end
  end
end
