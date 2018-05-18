class CoursesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_course, only: [:destroy]

  def index
    @courses = Course.includes(:user).all
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    respond_to do |format|
      if @course.save
        format.html {redirect_to courses_path, notice: 'Course was successfully created.'}
      else
        format.html { render :new }
      end 
    end   
  end
  def destroy
    respond_to do |format|
      if @course.lectures.size.zero?
        @course.destroy
        format.html {redirect_to courses_path, notice: 'Course was successfully deleted.'}
      else
        format.html {redirect_to courses_path, notice: 'Course can\'t deleted.'}
      end 
    end   
  end  
  private

    def course_params
      params.require(:course).permit(:title)
    end

    def set_course
      @course = Course.find(params[:id])
    end  
end

