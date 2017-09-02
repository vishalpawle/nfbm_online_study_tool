require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { address_one: @student.address_one, address_three: @student.address_three, address_two: @student.address_two, city: @student.city, computer_literacy_level: @student.computer_literacy_level, course_name: @student.course_name, date_of_birth: @student.date_of_birth, do_you_have_membership_of_nfbmpune: @student.do_you_have_membership_of_nfbmpune, email: @student.email, first_name: @student.first_name, gender: @student.gender, have_you_completed_any_computer_cource: @student.have_you_completed_any_computer_cource, last_name: @student.last_name, mid_name: @student.mid_name, mobile_number: @student.mobile_number, occupation: @student.occupation, percentages_of_blindness: @student.percentages_of_blindness, pin: @student.pin, qualification: @student.qualification, state: @student.state, tirms: @student.tirms, user_id: @student.user_id, which_assistive_technology_do_you_use: @student.which_assistive_technology_do_you_use }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { address_one: @student.address_one, address_three: @student.address_three, address_two: @student.address_two, city: @student.city, computer_literacy_level: @student.computer_literacy_level, course_name: @student.course_name, date_of_birth: @student.date_of_birth, do_you_have_membership_of_nfbmpune: @student.do_you_have_membership_of_nfbmpune, email: @student.email, first_name: @student.first_name, gender: @student.gender, have_you_completed_any_computer_cource: @student.have_you_completed_any_computer_cource, last_name: @student.last_name, mid_name: @student.mid_name, mobile_number: @student.mobile_number, occupation: @student.occupation, percentages_of_blindness: @student.percentages_of_blindness, pin: @student.pin, qualification: @student.qualification, state: @student.state, tirms: @student.tirms, user_id: @student.user_id, which_assistive_technology_do_you_use: @student.which_assistive_technology_do_you_use }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
