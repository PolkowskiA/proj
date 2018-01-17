class CommentsController < ApplicationController
<<<<<<< HEAD

 

  def show  
    comment
  end

=======
   
>>>>>>> auth
  def new
    @comment = project.comments.build
  end

  def create
<<<<<<< HEAD
    @comment = project.comments.build(comments_params)
    if @comment.save
      redirect_to project_comment_path(project, @comment)
=======
    @comment = project.comments.build(comments_params)    
    @comment.user = current_user
    if @comment.save
      redirect_to project_path(@project)
>>>>>>> auth
    else
      render :new
    end
  end
<<<<<<< HEAD
  
  def edit    
=======

  def edit
>>>>>>> auth
    comment
  end

  def update
<<<<<<< HEAD
    if comment.update(params[:comment])
      redirect_to project_comments_path(@project, @comment)
=======
    if comment.update(comments_params)
      redirect_to project_path(@project)
>>>>>>> auth
    else
      render :edit
    end
  end

<<<<<<< HEAD
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
=======
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
>>>>>>> auth
  end

  def comment
    @comment ||= project.comments.find(params[:id])
  end
<<<<<<< HEAD
  
=======
>>>>>>> auth
end