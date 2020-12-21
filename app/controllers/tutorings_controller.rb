class TutoringsController < ApplicationController
  before_action :set_tutoring, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /tutorings
  # GET /tutorings.json
  def index
    @tutorings = @homework.tutorings.all
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
        format.html { redirect_to @tutoring, notice: 'Tutoring was successfully created.' }
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
      @tutoring = @homework.tutorings.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutoring_params
      params.require(:tutoring).permit(:due_date, :description, :price, :due_date, :subject_id)
    end
end
