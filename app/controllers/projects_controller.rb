class ProjectsController < ApplicationController

  def index

    @projects = Project.all.order(:id).page(params[:page]).per(10)
    @projects.total_pages

  end

  def show

    project
    @comments = project.comments.order("updated_at DESC").page(params[:page]).per(10)
      @rating = Rating.where(comment_id: @comment.id, user_id: current_user.id).first
        unless @rating
      @rating = Rating.create(comment_id: @comment.id, user_id: current_user.id, score: 0)
      end
        
  end
    

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project was created'
    else
      render :new
    end
  end

  def edit
    project
  end

  def update
    if project.update(project_params)
      redirect_to project_path, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  private

  def project
    @project ||= Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :image, :description)
  end

end