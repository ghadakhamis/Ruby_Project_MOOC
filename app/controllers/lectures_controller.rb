class LecturesController < InheritedResources::Base
  before_action :authenticate_user!

  def index
    @lectures = Lecture.includes(:course).all
  end  

  def show
    @lecture = Lecture.includes(:course).find(params[:id])
  end  
  private

    def lecture_params
      params.require(:lecture).permit(:content, :attachment, :course_id)
    end
end

