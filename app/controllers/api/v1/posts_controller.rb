class Api::V1::PostsController < ApplicationController
  before_action :set_api_v1_post, only: %i[show edit update destroy]

  # GET /api/v1/posts or /api/v1/posts.json
  def index
    @api_v1_posts = Api::V1::Post.all
  end

  # GET /api/v1/posts/1 or /api/v1/posts/1.json
  def show; end

  # GET /api/v1/posts/new
  def new
    @api_v1_post = Api::V1::Post.new
  end

  # GET /api/v1/posts/1/edit
  def edit; end

  # POST /api/v1/posts or /api/v1/posts.json
  def create
    @api_v1_post = Api::V1::Post.new(api_v1_post_params)

    respond_to do |format|
      if @api_v1_post.save
        format.html { redirect_to api_v1_post_url(@api_v1_post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @api_v1_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/posts/1 or /api/v1/posts/1.json
  def update
    respond_to do |format|
      if @api_v1_post.update(api_v1_post_params)
        format.html { redirect_to api_v1_post_url(@api_v1_post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v1_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/posts/1 or /api/v1/posts/1.json
  def destroy
    @api_v1_post.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_post
    @api_v1_post = Api::V1::Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def api_v1_post_params
    params.require(:api_v1_post).permit(:title, :content)
  end
end
