class HomeworksController < ApplicationController
  before_action :set_user
  before_action :set_homework, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /homeworks
  # GET /homeworks.json
  def index
    @homeworks = @user.homeworks
    authorize @homeworks
  end

  def all_homeworks
    @homeworks = Homework.all
    # @homeworks = Homework.where('due_date >= ?', DateTime.now)
  end

  # GET /homeworks/1
  # GET /homeworks/1.json
  def show
  end

  # GET /homeworks/new
  def new
    @homework = @user.homeworks.new
    authorize @homework
    
  end

  # GET /homeworks/1/edit
  def edit
    authorize @homework

  end

  # POST /homeworks
  # POST /homeworks.json
  def create
    @homework = @user.homeworks.new(homework_params)
    authorize @homework
    respond_to do |format|
      if @homework.save
        format.html { redirect_to @homework, notice: 'Homework was successfully created.' }
        format.json { render :show, status: :created, location: @homework }
      else
        format.html { render :new }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homeworks/1
  # PATCH/PUT /homeworks/1.json
  def update
    authorize @homework
    
    respond_to do |format|
      if @homework.update(homework_params)
        format.html { redirect_to @homework, notice: 'Homework was successfully updated.' }
        format.json { render :show, status: :ok, location: @homework }
      else
        format.html { render :edit }
        format.json { render json: @homework.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homeworks/1
  # DELETE /homeworks/1.json
  def destroy
    @homework.destroy
    respond_to do |format|
      format.html { redirect_to homeworks_url, notice: 'Homework was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user || User.find(params[:student_id])
    end

    def set_homework
      @homework = @user.homeworks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def homework_params
      params.require(:homework).permit(:name, :description, :price, :due_date, :subject_id, :file_link)
    end
end
