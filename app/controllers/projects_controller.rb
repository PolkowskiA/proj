class ProjectsController < ApplicationController
<<<<<<< HEAD

  def index
    @projects = Project.all#.page(params[:page]).per(5)
  end

  def show
    project
    @comments = project.comments.page(params[:page]).per(5)
  end
=======
  
  def index    
    @projects = Project.all.order(:id).page(params[:page]).per(10)        
  end

  def show
    project   
    @comments = project.comments.order("updated_at DESC").page(params[:page]).per(10)
  end    
>>>>>>> auth

  def new
    @project = Project.new
  end

  def create
<<<<<<< HEAD
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Dodalo project'
=======
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project was created'
>>>>>>> auth
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
<<<<<<< HEAD
  end
=======
  end  
>>>>>>> auth

  def destroy
    project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
<<<<<<< HEAD
  end
=======
  end  
>>>>>>> auth

  private

  def project
    @project ||= Project.find(params[:id])
  end

  def project_params
<<<<<<< HEAD
    params.require(:project).permit(:name)
  end
end
=======
    params.require(:project).permit(:name, :image, :description)
  end

end
>>>>>>> auth
