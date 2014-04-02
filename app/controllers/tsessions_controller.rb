class TsessionsController < ApplicationController
  before_action :set_tsession, only: [:show, :edit, :update, :destroy]

  # GET /tsessions
  # GET /tsessions.json
  def index
    @tsessions = Tsession.all
    @tsessionjson= Tsession.find_by_sql ["SELECT T.id,C.class_name,S.subject_name,U.name 'trainer_name',R.room_name,T.start_time,T.end_time, T.status
                                           FROM (Tsessions as T
                                            INNER JOIN Subjects as S 
                                                ON(T.subject_id=S.id)
                                            INNER JOIN Training_classes as C 
                                                ON (T.training_class_id=C.id)
                                            INNER JOIN Rooms  as R 
                                                ON(T.room_id=R.id)
                                            INNER JOIN Users as U 
                                                ON (T.user_id=U.id))
                                                                       
                                        "]
    respond_to do |format|
      format.html # index.html.erb
      format.json {render :json=>{:session=>@tsessionjson}}
    end
  end

  # GET /tsessions/1
  # GET /tsessions/1.json
  def show
    @tsessionjson= Tsession.find_by_sql ["SELECT S.subject_name,T.id,C.class_name,
                                          U.name 'trainer_name',R.room_name,T.start_time,T.end_time, 
                                          T.status, C.start_date, C.end_date, B.building_name, B.description,
                                          Courses.course_name  

                                           FROM (Tsessions as T
                                            INNER JOIN Subjects as S 
                                                ON(T.subject_id=S.id)

                                            INNER JOIN Training_classes as C 
                                                ON (T.training_class_id=C.id)

                                            INNER JOIN Courses
                                                ON (Courses.id=C.course_id)

                                            INNER JOIN Rooms  as R 
                                                ON(T.room_id=R.id)

                                            INNER JOIN Buildings as B
                                                ON (B.id=R.building_id)
                                            INNER JOIN Users as U 
                                                ON (T.user_id=U.id))
                                            WHERE T.id=?",                                                               
                                        @tsession.id]
    respond_to do |format|
      format.html # index.html.erb
      format.json {render :json=>{:sessions=>@tsessionjson.first}}
    end
  end

def session_info
  
    @tsessioninfojson= Tsession.find_by_sql ["SELECT S.subject_name,C.class_name,
                                          R.room_name,T.start_time,T.end_time, 

                                           FROM (Tsessions as T
                                            INNER JOIN Subjects as S 
                                                ON(T.subject_id=S.id)

                                            INNER JOIN Training_classes as C 
                                                ON (T.training_class_id=C.id)

                                            INNER JOIN Rooms  as R 
                                                ON(T.room_id=R.id))                                            
                                            WHERE T.id=?",                                                               
                                        @tsession.id]
    respond_to do |format|
      format.html # index.html.erb
      format.json {render :json=>{:sessions=>@tsessioninfojson.first}}
    end
  end

  # GET /tsessions/new
  def new
    @tsession = Tsession.new
  end

  # GET /tsessions/1/edit
  def edit
  end

  # POST /tsessions
  # POST /tsessions.json
  def create
    @tsession = Tsession.new(tsession_params)

    respond_to do |format|
      if @tsession.save
        format.html { redirect_to @tsession, notice: 'Tsession was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tsession }
      else
        format.html { render action: 'new' }
        format.json { render json: @tsession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tsessions/1
  # PATCH/PUT /tsessions/1.json
  def update
    respond_to do |format|
      if @tsession.update(tsession_params)
        format.html { redirect_to @tsession, notice: 'Tsession was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tsession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tsessions/1
  # DELETE /tsessions/1.json
  def destroy
    @tsession.destroy
    respond_to do |format|
      format.html { redirect_to tsessions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tsession
      @tsession = Tsession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tsession_params
      params.require(:tsession).permit(:training_class_id, :subject_id, :room_id, :user_id, :start_time, :end_time, :status, :training_class_id, :user_id, :room_id, :subject_id, :member_class_id)
    end
end
