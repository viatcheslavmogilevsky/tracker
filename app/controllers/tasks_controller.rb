class TasksController < ApplicationController
before_filter :find_task, :only => [:update, :edit, :show, :destroy]
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])
    if @task.save?
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    if @task.update_attributes(params[:task])
      redirect_to @task
    else
      render 'edit'
    end
  end

  def edit

  end

  def show

  end

  def complete
    @task.complete
  end

  def destroy
    @task.destroy
    redirect_to user_path(@task.user)
  end
  private

  def find_task
    @task = Task.find(params[:id])
  end
end
