class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    @level = Level.find(params[:level_id])
    @exams = @level.exams
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @level = Level.find(params[:level_id])
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @level = Level.find(params[:level_id])

    @exam = @level.exams.build(exam_params)

    respond_to do |format|
      if @exam.save
      if params[:subjects] != nil

        params[:subjects].each do |subject|
          @es = ExamsSubject.new()
          @es.exam_id = @exam.id
          @es.subject_id = subject
          if @es.save
          end
        end
      end
        format.html { redirect_to setpaper_path(@exam), notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end
  def setpaper
    @exam = Exam.find(params[:exam_id])
    if request.post?
      @paper = Paper.new()
      @paper.exam_id = @exam.id
      @paper.paper_name = params[:paperName]
      if @paper.save
        if params[:questions] != nil
          params[:questions].each do |q|
            @question = Question.find(q)
            @question.paper_id = @paper.id
            if @question.save
            end
          end
        end
      redirect_to levels_path
      end
    end
  end
  def setting
    @exam = Exam.find(params[:exam_id])
    @paper = @exam.papers.where(:attempt_flag => nil)
    if request.put?
      if params[:papers] != nil
        params[:papers].each do |p|
          @paper = Paper.find(p)
          @paper.attempt_flag = true
          if @paper.save
          end
        end
      end
    redirect_to currentpaper_path(@exam)
    end
  end
  def currentpaper
    @exam = Exam.find(params[:exam_id])
    @paper = @exam.papers.where(:attempt_flag => nil)
    if request.put?
      @p = Paper.find(params[:paper])
      @p.current_paper_flag = true
      if @p.save
        redirect_to levels_path
      end
    end
  end
  def examinstruction
    @exam = Exam.find(params[:format])
  end
  def giveexam
    @questions_count = []
    @exam = Exam.find(params[:exam_id])
    @paper = @exam.papers.where(:current_paper_flag => true)
    @paper.last.questions.each do |q|
      @questions_count.push(q.id)
    end
    if request.post?
      @attempt = Attempt.new()
      @attempt.paper_id = @paper.last.id
      @attempt.student_id = current_user.student.id
      @attempt.total_marks = @questions_count.size
      # Calculate the cutoff in next line:
      # Use the temp varible to store the value of @questions_count.size in somewhere:
      @min_marks_var = @questions_count.size
      @attempt.require_marks = @min_marks_var *40/100
      @attempt.attempted_date = Date.today
      if @attempt.save
        @paper.last.questions.each_index do |i|
          p 'q var is,'
          @q = @paper.last.questions[i]
          if params[@q.id.to_s]
            @option = Option.find(params[@q.id.to_s])
            @option.attempt_id = @attempt.id
            if @option.save
            end
          end
        end
        @get_marks = @attempt.options.where(:option_right => true)
        @calculate_marks = @get_marks.size
        @result = Result.new()
        # Next line should be commented because it is unutilized
        # if @attempt.total_marks > 1 && @attempt.total_marks <= 10 && @calculate_marks >= 4
        if @calculate_marks >= @attempt.require_marks  && @calculate_marks <= @attempt.total_marks
          @result.result_status = "PASS"
          @result.get_marks = @calculate_marks
          @result.min_marks = @attempt.require_marks
          @result.total_marks = @attempt.total_marks
          else
          @result.result_status = "FAIL"
          @result.get_marks = @calculate_marks
          @result.total_marks = @attempt.total_marks
          @result.min_marks = @attempt.require_marks
          end
        @result.attempt_id = @attempt.id
        @result.student_id = current_user.student.id
        if @result.save
          redirect_to result_path(@result)
          # r = @result
        #user = User.where(:roles => 'admin').collect(&:email)
          #UserMailer.examreport(user, r).deliver
        end
      end
    end
  end
  def result
    @result = Result.find(params[:format])
  end
  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:exam_name, :exam_date, :exam_discription, :exam_instructions, :level_id, :type_of_exam)
    end
end
