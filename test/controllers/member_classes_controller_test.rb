require 'test_helper'

class MemberClassesControllerTest < ActionController::TestCase
  setup do
    @member_class = member_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_class" do
    assert_difference('MemberClass.count') do
      post :create, member_class: { birthday: @member_class.birthday, email: @member_class.email, full_name: @member_class.full_name }
    end

    assert_redirected_to member_class_path(assigns(:member_class))
  end

  test "should show member_class" do
    get :show, id: @member_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_class
    assert_response :success
  end

  test "should update member_class" do
    patch :update, id: @member_class, member_class: { birthday: @member_class.birthday, email: @member_class.email, full_name: @member_class.full_name }
    assert_redirected_to member_class_path(assigns(:member_class))
  end

  test "should destroy member_class" do
    assert_difference('MemberClass.count', -1) do
      delete :destroy, id: @member_class
    end

    assert_redirected_to member_classes_path
  end
end
