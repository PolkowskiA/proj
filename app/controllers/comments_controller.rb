class CommentsController < ApplicationController
  def show
    comment
  end

  def new
    @comment = project.comments.build
  end

  def create
    @comment = project.comments.build(comments_params)
    if @comment.save
      redirect_to project_comment_path(project, @comment)
    else
      render :new
    end
  end

  def edit
    comment
  end

  def update
    if comment.update(params[:comment])
      redirect_to project_comments_path(@project, @comment)
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
    params.require(:comment).permit(:status)
  end

  def project
    @project ||= Project.find(params[:project_id])
  end

  def comment
    @comment ||= project.comments.find(params[:id])
  end
end
