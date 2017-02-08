class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    respond_to do |format|
      format.html {
        @task = Task.new(task_params)
        if @task.save
          redirect_to tasks_path, success: 'succress create task'
        else
          render :new
        end
      }
      format.js {
        @tasks = Task.all
        @task = Task.create(task_params)
      }
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @tasks = Task.all
    @task = Task.find(params[:id])

    @task.update_attributes(task_params)
  end

  def delete
    @task = Task.find(params[:task_id])
  end

  def destroy
    @tasks = Task.all
    @task = Task.find(params[:id])
    @task.destroy
  end

private
  def task_params
    params.require(:task).permit(:name)
  end
end
