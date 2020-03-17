class PostsController < ApplicationController
  before_action :restrict_access, only:[:new, :create] 

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(comment: params[:comment], user_id: current_user.id) 
    #@user = User.new(user_params)
    #@user.password = params[:password]
    
    if @post.valid?
      @post.save
      redirect_to '/'
    else
      flash[:danger] = 'Invalid email/password combination'
    end
  end

  private def restrict_access
    if !logged_in?
      redirect_to '/login'
    end
  end
end
