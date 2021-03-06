class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /students
  # GET /students.json
  def index
    if current_user.role == 'admin' || current_user.role == 'teacher'
      @students = Student.all
    else
      @student = current_user.student
    end
  end
  # Show All levels of student
  def mylevels
    @student = Student.find(params[:student_id])
    @studentlevels = @student.levels
    @current_student_level = @student.levels.last
  end
  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :mid_name, :gender, :date_of_birth, :mobile_number, :email, :address_one, :address_two, :address_three, :city, :state, :pin, :occupation, :qualification, :have_you_completed_any_computer_cource, :course_name, :computer_literacy_level, :percentages_of_blindness, :which_assistive_technology_do_you_use, :do_you_have_membership_of_nfbmpune, :tirms, :user_id)
    end
end
