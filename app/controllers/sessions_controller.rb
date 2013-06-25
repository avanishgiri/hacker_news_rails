class SessionsController < ApplicationController 
  def index
    @posts = Post.all
  end

  def create
    user = User.new(params[:user])
    if user.save
      session[:id] = user.id
      redirect_to '/'
    else
      render :new, :flash => { :error => "didn't work!" }
    end
  end

  def new
    @user = User.new
  end

  def sign_in
  end

  def log_in
    user = User.find_by_name(params[:name])
    if user.password == params[:password]
      session[:id] = user.id
      redirect_to '/'
    else
      render :sign_in, :flash => { :error => "username or pw not found"}
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
