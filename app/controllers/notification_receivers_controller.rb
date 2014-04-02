class NotificationReceiversController < ApplicationController
  before_action :set_notification_receiver, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :all

  # GET /notification_receivers
  # GET /notification_receivers.json
  def index
    @notification_receivers = NotificationReceiver.all
  end

  # GET /notification_receivers/1
  # GET /notification_receivers/1.json
  def show
  end

  # GET /notification_receivers/new
  def new
    @notification_receiver = NotificationReceiver.new
  end

  # GET /notification_receivers/1/edit
  def edit
  end

  # POST /notification_receivers
  # POST /notification_receivers.json
  def create
    @notification_receiver = NotificationReceiver.new(notification_receiver_params)

    respond_to do |format|
      if @notification_receiver.save
        format.html { redirect_to @notification_receiver, notice: 'Notification receiver was successfully created.' }
        format.json { render action: 'show', status: :created, location: @notification_receiver }
      else
        format.html { render action: 'new' }
        format.json { render json: @notification_receiver.errors, status: :unprocessable_entity }
      end
    end
  end


  def update_notification
    begin
        @notification_receiver=NotificationReceiver.new(notification_receiver_params)
        @user_id= params[:notification_receiver][:user_id]
        @notification_id=params[:notification_receiver][:notification_id]
       # @status=params[:notification_receiver][:status]
        @notification_receiver_id=NotificationReceiver.find_by_sql ["SELECT id 
                                                                  FROM Notification_receivers
                                                                  WHERE notification_id=?
                                                                  AND receiver_id=?",
                                                                  @notification_id,@user_id]
       
        success=NotificationReceiver.update_all({:status => '1'},{:id => @notification_receiver_id.first.id})
  
    rescue =>ex
        puts ex
      ensure
        respond_to do |format|
            if success==1
              format.html
              format.json { render :json=>{:msg=>"successfully",:notification_id => @notification_receiver_id.first.id} }
            else
              format.html
              format.json { render :json=>{:msg=>"not successfully"}}
            end
      end
    end
     

  end

  # PATCH/PUT /notification_receivers/1
  # PATCH/PUT /notification_receivers/1.json
  def update
    respond_to do |format|
      if @notification_receiver.update(notification_receiver_params)
        format.html { redirect_to @notification_receiver, notice: 'Notification receiver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notification_receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_receivers/1
  # DELETE /notification_receivers/1.json
  def destroy
    @notification_receiver.destroy
    respond_to do |format|
      format.html { redirect_to notification_receivers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_receiver
      @notification_receiver = NotificationReceiver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_receiver_params
      params.require(:notification_receiver).permit(:notification_id, :receiver_id, :status)
    end
end
