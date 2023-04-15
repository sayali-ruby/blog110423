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
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    else
      render 'show'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
