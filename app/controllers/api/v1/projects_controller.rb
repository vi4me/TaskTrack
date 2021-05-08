class Api::V1::ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :old_tasks, :update, :destroy]
  before_action :authenticate_user!

  def index
    projects = Project.order('created_at DESC').page(params[:page]).per(params[:per_page])
    render json: projects, each_serializer: Api::V1::ProjectsSerializer
  end

  def show
    render json: @project, serializer: Api::V1::ProjectsSerializer
  end

  # http://localhost:3000/api/v1/projects/id/old_tasks
  def old_tasks
    render json: @project, serializer: Api::V1::OldTasksSerializer
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, serializer: Api::V1::ProjectsSerializer, status: :created
    else
      render json: @project.errors, serializer: ErrorSerializer
    end
  end

  def update
    if current_user != @user
      if @project.update(project_params)
        render json: @project, serializer: Api::V1::ProjectsSerializer, status: :ok
      else
        render json: @project.errors, serializer: ErrorSerializer
      end
    end
  end

  def destroy
    if current_user != @user
      @project.destroy
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :complexity)
    end
end
