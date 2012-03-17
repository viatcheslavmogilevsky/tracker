class TasksController < ApplicationController
before_filter :find_user
before_filter :find_task, :only => [:update, :edit, :show, :destroy, :set_complete]
  def new
    @task = Task.new
  end

  def create
    @task = @user.tasks.new(params[:task])
    if @task.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def update
    if @task.update_attributes(params[:task])
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
  end

  def show
  end


  def set_complete
    @task.update_attribute(:complete, true)
    redirect_to @user
  end

  def destroy
    @task.destroy
    redirect_to user_path(@user)
  end
  private

  def find_task
    @task = Task.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
