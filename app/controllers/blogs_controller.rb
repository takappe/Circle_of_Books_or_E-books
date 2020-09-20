class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    #Blog.create(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "blogを投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :blog).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end