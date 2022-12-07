class DashboardController < ApplicationController
  before_action :authorize, except: [:index]
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.includes(:user).all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      flash[:notice] = 'Post has been sent'
      redirect_to root_path
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update

    if @post.update(post_params)
      flash[:notice] = 'Post is updated'
      redirect_to root_path
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post was successfully destroyed.'
  end

  private

  def authorize
    redirect_to root_path unless logged_in?
  end

  def set_post
    @post = Post.find(params[:id])
    redirect_to root_path if session[:user_id] != @post[:user_id]
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Post does not exist.'
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
