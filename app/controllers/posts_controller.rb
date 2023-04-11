class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
