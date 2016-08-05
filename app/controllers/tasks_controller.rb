class TasksController < ApplicationController

  def index
    @task = Task.all
    # @task = @task.sort_by { |task| task.date }
  end

  def show 
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new(task_params)
  end


private
  def task_params
      params.permit(:title, :description, :date)
  end

  
end
