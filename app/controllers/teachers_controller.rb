class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /teachers
  # GET /teachers.json
  def index
    if current_user.role == 'admin'
      @teachers = Teacher.all
    else
      @teacher = current_user.teacher
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def assignleveltoteacher
    @teacher = Teacher.find(params[:teacher_id])
    @exclude_ids_array = []
    if request.get?
      @teacherlevels = @teacher.levels
      if @teacherlevels.size > 0
          @teacherlevels.each do |tl|
            @exclude_ids_array.push(tl.id)
          end
        @assign_var = Level.where.not(id: @exclude_ids_array)
      else
        @assign_var = Level.all
      end
    end
    if request.post? && params != nil
      params[:levels].each do |ls|
        @level_teachers = LevelsTeacher.new()
        @level_teachers.teacher_id = @teacher.id
        @level_teachers.level_id = ls
        if @level_teachers.save
        end
      end
    redirect_to teachers_path
    end
  end
  def readmylevel
    @teacher = Teacher.find(params[:teacher_id])
    @teacher_read = @teacher.levels
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :gender, :date_of_birth, :mobile_number, :email, :listening_skills_jaws, :writing_skills_with_jaws, :strengths, :weaknesses, :tirms, :user_id)
    end
end
