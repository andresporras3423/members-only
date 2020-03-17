class PostsController < ApplicationController
  before_action :restrict_access, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new; end

  def create
    @post = Post.new(comment: params[:comment], user_id: current_user.id)
    # @user = User.new(user_params)
    # @user.password = params[:password]

    if @post.valid?
      @post.save
      redirect_to '/'
    else
      flash[:danger] = 'post cannot be empty'
      redirect_to '/add_comment'
    end
  end

  private

  def restrict_access
    redirect_to '/login' unless logged_in?
  end
end
