require 'test_helper'

class TsessionsControllerTest < ActionController::TestCase
  setup do
    @tsession = tsessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tsessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tsession" do
    assert_difference('Tsession.count') do
      post :create, tsession: { end_time: @tsession.end_time, member_class_id: @tsession.member_class_id, room_id: @tsession.room_id, room_id: @tsession.room_id, start_time: @tsession.start_time, status: @tsession.status, subject_id: @tsession.subject_id, subject_id: @tsession.subject_id, training_class_id: @tsession.training_class_id, training_class_id: @tsession.training_class_id, user_id: @tsession.user_id, user_id: @tsession.user_id }
    end

    assert_redirected_to tsession_path(assigns(:tsession))
  end

  test "should show tsession" do
    get :show, id: @tsession
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tsession
    assert_response :success
  end

  test "should update tsession" do
    patch :update, id: @tsession, tsession: { end_time: @tsession.end_time, member_class_id: @tsession.member_class_id, room_id: @tsession.room_id, room_id: @tsession.room_id, start_time: @tsession.start_time, status: @tsession.status, subject_id: @tsession.subject_id, subject_id: @tsession.subject_id, training_class_id: @tsession.training_class_id, training_class_id: @tsession.training_class_id, user_id: @tsession.user_id, user_id: @tsession.user_id }
    assert_redirected_to tsession_path(assigns(:tsession))
  end

  test "should destroy tsession" do
    assert_difference('Tsession.count', -1) do
      delete :destroy, id: @tsession
    end

    assert_redirected_to tsessions_path
  end
end
