class TrainingClassesController < ApplicationController
  before_action :set_training_class, only: [:show, :edit, :update, :destroy]

  # GET /training_classes
  # GET /training_classes.json
  def index
    #Get all undeleted classes from database
    @training_classes = TrainingClass.find_by_sql ["SELECT * FROM training_classes"] 
    respond_to do |format|
      format.html # index.html.erb
      format.json {render json: @training_classes}
    end
  end

  # GET /training_classes/1
  # GET /training_classes/1.json
  def show    
    respond_to do |format|
      format.html # show.html.erb
      format.json {render json: @training_class}
    end
  end

  # GET /training_classes/new
  def new
    @training_class = TrainingClass.new
    @courses = Course.all
  end

  # GET /training_classes/1/edit
  def edit
    @courses = Course.all
  end

  # POST /training_classes
  # POST /training_classes.json
  def create
    @course = Course.find_by(id: params[:course])
    @training_class = @course.training_classes.new(training_class_params)
    

    respond_to do |format|
      if @training_class.save
        format.html { redirect_to @training_class, notice: 'Training class was successfully created.' }
        format.json { render action: 'show', status: :created, location: @training_class }
      else
        format.html { render action: 'new' }
        format.json { render json: @training_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_classes/1
  # PATCH/PUT /training_classes/1.json
  def update
    @course = Course.find_by(id: params[:course])
    @training_class.course_id=params[:course]
    respond_to do |format|
      if @training_class.update(training_class_params) and @training_class.update_attribute(:course_id, params[:course])
        format.html { redirect_to @training_class, notice: 'Training class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @training_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_classes/1
  # DELETE /training_classes/1.json
  def destroy
    @training_class.destroy
    respond_to do |format|
      format.html { redirect_to training_classes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_class
      @training_class = TrainingClass.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def training_class_params
      params.require(:training_class).permit(:class_name, :start_date, :end_date)
    end
end