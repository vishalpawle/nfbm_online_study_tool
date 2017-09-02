require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, request: { accept_flag: @request.accept_flag, address_one: @request.address_one, address_two: @request.address_two, city: @request.city, email: @request.email, first_name: @request.first_name, last_name: @request.last_name, mobile: @request.mobile, pin: @request.pin, state: @request.state }
    end

    assert_redirected_to request_path(assigns(:request))
  end

  test "should show request" do
    get :show, id: @request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request
    assert_response :success
  end

  test "should update request" do
    patch :update, id: @request, request: { accept_flag: @request.accept_flag, address_one: @request.address_one, address_two: @request.address_two, city: @request.city, email: @request.email, first_name: @request.first_name, last_name: @request.last_name, mobile: @request.mobile, pin: @request.pin, state: @request.state }
    assert_redirected_to request_path(assigns(:request))
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, id: @request
    end

    assert_redirected_to requests_path
  end
end
