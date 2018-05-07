class LecturesController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    @lectures = Lecture.includes(:course).all
  end  

  def show
    @lecture = Lecture.includes(:course).find(params[:id])
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
  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id)
    end
end

