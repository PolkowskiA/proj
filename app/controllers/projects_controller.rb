class ProjectsController < ApplicationController

	before_action :has_permission?, only: [:edit, :update, :destroy]
	
	def index
		@projects = Project.all.order(:id).page(params[:page]).per(5)
	end

	def show
		project
		@avg_rating ||= commentz.blank? ? 0 : commentz.average(:rating).round(2)
		@comments = @commentz.order("updated_at DESC").page(params[:page]).per(5)
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

	def commentz
		@commentz ||= @project.comments
	end

	def project
		@project ||= Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :image, :description)
	end

end