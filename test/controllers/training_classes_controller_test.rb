require 'test_helper'

class TrainingClassesControllerTest < ActionController::TestCase
  setup do
    @training_class = training_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:training_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training_class" do
    assert_difference('TrainingClass.count') do
      post :create, training_class: { class_name: @training_class.class_name, course_id: @training_class.course_id, delete_flag: @training_class.delete_flag, end_date: @training_class.end_date, start_date: @training_class.start_date }
    end

    assert_redirected_to training_class_path(assigns(:training_class))
  end

  test "should show training_class" do
    get :show, id: @training_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @training_class
    assert_response :success
  end

  test "should update training_class" do
    patch :update, id: @training_class, training_class: { class_name: @training_class.class_name, course_id: @training_class.course_id, delete_flag: @training_class.delete_flag, end_date: @training_class.end_date, start_date: @training_class.start_date }
    assert_redirected_to training_class_path(assigns(:training_class))
  end

  test "should destroy training_class" do
    assert_difference('TrainingClass.count', -1) do
      delete :destroy, id: @training_class
    end

    assert_redirected_to training_classes_path
  end
end
