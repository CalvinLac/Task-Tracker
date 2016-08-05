class TasksController < ApplicationController

  def index
    @task = Task.all
    # @task = @task.sort_by { |task| task.date }
  end

  def show 
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create 
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(@task)
    else
      rerender new_task_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to root_path
    else
      rerender task_path
    end
  end

private
  def task_params
       params.require(:task).permit(:title, :description, :date)
  end


end
