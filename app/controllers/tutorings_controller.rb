class TutoringsController < ApplicationController
  before_action :set_tutoring, only: [:show, :edit, :update, :destroy]
  before_action :set_homework, only: [:create, :update]
  before_action :authenticate_user!


  # GET /tutorings
  # GET /tutorings.json
  def index
    if current_user.teacher?
      @tutorings = current_user.tutorings
    else
       if current_user.homeworks.any?        
        @tutorings = Tutoring.where(homework_id: current_user.homeworks.pluck(id))
       else
        @tutorings = []
       end 
    end
  end

  # GET /tutorings/1
  # GET /tutorings/1.json
  def show
  end

  # GET /tutorings/new
  def new
    @tutoring = @homework.tutorings.new
  end

  # GET /tutorings/1/edit
  def edit
  end

  # POST /tutorings
  # POST /tutorings.json
  def create
    @tutoring = @homework.tutorings.new(tutoring_params)

    respond_to do |format|
      if @tutoring.save
        format.html { redirect_to tutorings_path, notice: 'Ha acceptado el encargo.' }
        format.json { render :show, status: :created, location: @tutoring }
      else
        format.html { render :new }
        format.json { render json: @tutoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorings/1
  # PATCH/PUT /tutorings/1.json
  def update
    respond_to do |format|
      if @tutoring.update(tutoring_params)
        format.html { redirect_to @tutoring, notice: 'Tutoring was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutoring }
      else
        format.html { render :edit }
        format.json { render json: @tutoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorings/1
  # DELETE /tutorings/1.json
  def destroy
    @tutoring.destroy
    respond_to do |format|
      format.html { redirect_to tutorings_url, notice: 'Tutoring was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_homework
      @homework = Homework.find(params[:homework_id])
    end


    def set_tutoring
      if @homework
        @tutoring = @homework.tutorings.find(params[:id])
      else
        @tutoring = Tutoring.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def tutoring_params
      params.permit(:due_date, :subject_id, :teacher_id)
    end
end
