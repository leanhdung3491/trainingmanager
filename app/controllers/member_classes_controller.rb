class MemberClassesController < ApplicationController
  before_action :set_member_class, only: [:show, :edit, :update, :destroy]

  # GET /member_classes
  # GET /member_classes.json
  def index
    @training_class_id=params[:tclassid]
    @member_class = MemberClass.find_by_sql ["SELECT *
                                            FROM Member_classes
                                            WHERE training_class_id=?",
                                                  @training_class_id]
  end

  # GET /member_classes/1
  # GET /member_classes/1.json
  def show

  end

  # GET /member_classes/new
  def new
    @training_class_id=params[:tclassid]
    @member_class = MemberClass.new
    @name='Add'
    @users=User.find_by_sql ["SELECT * 
                              FROM Users 
                              WHERE Users.id
                                  NOT IN (SELECT  Member_classes.user_id
                                  FROM Member_classes)
                              OR Users.id!=?",@training_class_id]
    #MemberClass.full_name=User.name

  end

  # GET /member_classes/1/edit
  def edit
    @name='Save'
  end

  # POST /member_classes
  # POST /member_classes.json
  def create
    @user = User.find_by(id: params[:user])
    @member_class = @user.member_classes.new(member_class_params)

    #@member_class = MemberClass.new(member_class_params)

    respond_to do |format|
      if @member_class.save
        format.html { redirect_to @member_class, notice: 'Member class was successfully created.' }
        format.json { render action: 'show', status: :created, location: @member_class }
      else
        format.html { render action: 'new' }
        format.json { render json: @member_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_classes/1
  # PATCH/PUT /member_classes/1.json
  def update
    respond_to do |format|
      if @member_class.update(member_class_params)
        format.html { redirect_to @member_class, notice: 'Member class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_classes/1
  # DELETE /member_classes/1.json
  def destroy
    @member_class.destroy
    respond_to do |format|
      format.html { redirect_to member_classes_url }
      format.json { head :no_content }
    end
  end

  def addmember
    begin
      @user_id_array=params[:users_add]
      @training_class_id=params[:tclassid]
      puts @training_class_id
      @user_id_array.each do |a|
        @member_class=MemberClass.new
        @member_class.user_id=a
        @member_class.training_class_id= @training_class_id
           
        if @member_class.save
          @savedmem=1
        else
          @savedmem=0
        end  
      end

    rescue =>ex
      puts ex
      success=0
    ensure

      respond_to do |format|
        if @savedmem==1
          format.html { redirect_to :action=>'index',:tclassid=>@training_class_id }
          format.json { render action: 'index', status: :created, location: @member_class }
        else
          format.html { render action: 'new', notice: 'Add not success' }
          format.json { render json: @member_class.errors, status: :unprocessable_entity }
        end
      end
    end

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_class
      @member_class = MemberClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_class_params
      params.require(:member_class).permit(:training_class_id,:user_id)
    end
end
