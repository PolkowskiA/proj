class CommentsController < ApplicationController
  def show
    comment
  end

  def new
    @comment = project.comments.build
  end

  def create
      # binding.pry
    @comment = project.comments.build(comments_params)    
    @comment.user = current_user
    if @comment.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    comment
  end

  def update
    if comment.update(comments_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    comment.destroy
    redirect_to project_path(project)
  end
    
  private

  def comments_params
    params.require(:comment).permit(:content, :rating)
  end

  def project
    @project ||= Project.find(params[:project_id])
  end

  def comment
    @comment ||= project.comments.find(params[:id])
  end
end