class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
 skip_before_filter :verify_authenticity_token, :all
  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create_notification
    begin
        @notification = Notification.new(notification_params)
        @notification.sender_id=params[:notification][:sender_id]
        @notification.message=params[:notification][:message]
        if @notification.save
          time=Time.now
          success=1
        else
          success=0
        end

        new_notification=Notification.find_by_sql ["SELECT Notifications.id 
                                                    FROM Notifications
                                                    WHERE Notifications.sender_id = ?
                                                    and Notifications.message = ?", 
                                                    @notification.sender_id, @notification.message]
        
        receivers=params[:notification][:receivers]
        receivers_id_array=receivers.split(',') 
            
        receivers_id_array.each do |r|
          @notification_receiver=NotificationReceiver.new
          @notification_receiver.notification_id=new_notification.last.id
          @notification_receiver.receiver_id=r.to_i
          @notification_receiver.status='0'#Not send

          if @notification_receiver.save
            success=1
          else
            success=0
          end

        end
    rescue =>ex
      puts ex
      success=0
    ensure
      respond_to do |format|
        if success==1
          format.html
          format.json { render :json=>{:msg=>"successfully"} }
        else
          format.html
          format.json { render :json=>{:msg=>"not successfully"}}
        end
      end 
    end
   
  end
  #Send Notification
 def send_notification
      begin
          @notification= Notification.new(notification_params)
          @user_id=params[:notification][:user_id]
          @send_notification=Notification.find_by_sql ["SELECT N.id ,U.name,N.message,NR.status,N.created_at
                                                        FROM Notifications as N Join Users as U 
                                                                on (N.sender_id=U.id)
                                                              Join Notification_receivers as NR 
                                                              on (N.id=NR.notification_id)
                                                        WHERE NR.status= ?
                                                        AND NR.receiver_id=? ",0, @user_id]
      rescue =>ex
        puts ex
      ensure
          respond_to do |format|
            format.html # index.html.erb
            format.json {render :json=>{:notifications=>@send_notification}}
         
      end
    end
  end

  #Update Notifications

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render action: 'show', status: :created, location: @notification }
      else
        format.html { render action: 'new' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end


 

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:sender_id, :message)
      #params.require({"notification":{"sender_id":"1","message":"this is"}})
    end
end
