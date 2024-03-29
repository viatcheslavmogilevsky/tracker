class UsersController < ApplicationController
  before_filter :find_user, :except => [:new, :create, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @tasks = @user.tasks
  end

  def index
    @users = User.all
  end

  def no_completed_tasks
    @tasks = @user.no_completed_tasks
    render 'show'
  end

  def after_deadline
    @tasks = @user.after_deadline
    render 'show'
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
