require 'test_helper'

class NotificationReceiversControllerTest < ActionController::TestCase
  setup do
    @notification_receiver = notification_receivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notification_receivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notification_receiver" do
    assert_difference('NotificationReceiver.count') do
      post :create, notification_receiver: { notification_id: @notification_receiver.notification_id, notification_id: @notification_receiver.notification_id, receiver_id: @notification_receiver.receiver_id, status: @notification_receiver.status }
    end

    assert_redirected_to notification_receiver_path(assigns(:notification_receiver))
  end

  test "should show notification_receiver" do
    get :show, id: @notification_receiver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notification_receiver
    assert_response :success
  end

  test "should update notification_receiver" do
    patch :update, id: @notification_receiver, notification_receiver: { notification_id: @notification_receiver.notification_id, notification_id: @notification_receiver.notification_id, receiver_id: @notification_receiver.receiver_id, status: @notification_receiver.status }
    assert_redirected_to notification_receiver_path(assigns(:notification_receiver))
  end

  test "should destroy notification_receiver" do
    assert_difference('NotificationReceiver.count', -1) do
      delete :destroy, id: @notification_receiver
    end

    assert_redirected_to notification_receivers_path
  end
end
