class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lecture, only: [:create]
  before_action :set_comment, only: [:destroy, :edit]

  def create
    @comment = Comment.new(comment_params) 
    @comment.user_id = current_user.id 
    @comment.lecture_id =  @lecture.id
    
    respond_to do |format|
      if @comment.save
        format.html {redirect_to lecture_path(@lecture), notice: 'Comment was successfully created.'}
      else
        format.html { redirect_to lecture_path(@lecture), notice: 'Comment can\'t create.' }
      end
    end      
  end
  
  def edit

  end

  def update
    @comment=Comment.find(params[:id])
    @lecture= Lecture.find(params[:lecture_id])
    if current_user.id ==@comment.user_id
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to lecture_path(@lecture), notice: 'comment was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    else
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to lecture_path(@lecture), notice: 'Not the owner of the comment.' }
        end
      end  
    end  
  end  


  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html  { redirect_to lecture_path(@lecture), notice: 'Comment was successfully destroyed.' }
      end  
    else
      respond_to do |format|
        format.html  { redirect_to lecture_path(@lecture), notice: 'Comment can\'t delete.' }
      end 
    end  

  end  

  private

  def set_lecture
    @lecture= Lecture.find(params[:lecture_id])
  end

  def set_comment
    @comment = Comment.find(params[:lecture_id])
    @lecture= Lecture.find(params[:id])
  end  
  def comment_params
    params.require(:comment).permit(:comment)
  end  

end
