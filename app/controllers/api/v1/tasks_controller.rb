class Api::V1::TasksController < ApplicationController

  before_action :set_task, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_project

  def index
    tasks = @project.tasks.order('created_at DESC')
    render json: tasks, each_serializer: Api::V1::TasksSerializer
  end

  def show
    render json: @task, serializer: Api::V1::TasksSerializer
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, serializer: Api::V1::TasksSerializer, status: :created
    else
      render json: @task.errors, serializer: ErrorSerializer
    end
  end

  def update
    if @task.update(task_params)
      render json: @task, serializer: Api::V1::TasksSerializer, status: :ok
    else
      render json: @task.errors, serializer: ErrorSerializer
    end
  end

  def destroy
    @task.destroy
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :deadline_date, :user_id, :project_id)
    end
end
