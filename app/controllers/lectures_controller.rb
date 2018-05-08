class LecturesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_lecture, only: [:show, :edit, :update, :destory, :like]

  def index
    @lectures = Lecture.includes(:course).all
  end  

  def show
    @lecture = Lecture.includes(:course).find(params[:id])
    @comments= Comment.includes(:user).where(lecture_id: @lecture).order(:created_at)
  end

  def create
    @lecture = Lecture.includes(:course).new(lecture_params)
    if current_user.id == @lecture.course.user_id 
      respond_to do |format|
        if @lecture.save
          format.html {redirect_to lectures_path, notice: 'Lecture was successfully created.'}
        else
          format.html { render :new }
        end 
      end 
    else
      respond_to do |format|
        format.html {redirect_to lectures_path, notice: 'This course didn\'t create by you .'}
      end  
    end  
  end 

  def like
    if !current_user.liked? @lecture
      @lecture.liked_by current_user
    else
      @lecture.unliked_by current_user
    end
    respond_to do |format|
      format.html {redirect_to lecture_path(@lecture)}
    end   
  end  
   
  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id)
    end

    def set_lecture
      @lecture = Lecture.find(params[:id])
      @likes= @lecture.get_likes.size 
    end  
    
end

