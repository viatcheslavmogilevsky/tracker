class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
  end

  def show
    @user = User.find
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:user])
  end

  def update

  end

  def destroy
  end
end
