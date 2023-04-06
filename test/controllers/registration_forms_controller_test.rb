require "test_helper"

class RegistrationFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registration_form = registration_forms(:one)
  end

  test "should get index" do
    get registration_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_registration_form_url
    assert_response :success
  end

  test "should create registration_form" do
    assert_difference("RegistrationForm.count") do
      post registration_forms_url, params: { registration_form: { date_of_birth: @registration_form.date_of_birth, email: @registration_form.email, first_name: @registration_form.first_name, last_name: @registration_form.last_name, slug: @registration_form.slug, submitted: @registration_form.submitted } }
    end

    assert_redirected_to registration_form_url(RegistrationForm.last)
  end

  test "should show registration_form" do
    get registration_form_url(@registration_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_registration_form_url(@registration_form)
    assert_response :success
  end

  test "should update registration_form" do
    patch registration_form_url(@registration_form), params: { registration_form: { date_of_birth: @registration_form.date_of_birth, email: @registration_form.email, first_name: @registration_form.first_name, last_name: @registration_form.last_name, slug: @registration_form.slug, submitted: @registration_form.submitted } }
    assert_redirected_to registration_form_url(@registration_form)
  end

  test "should destroy registration_form" do
    assert_difference("RegistrationForm.count", -1) do
      delete registration_form_url(@registration_form)
    end

    assert_redirected_to registration_forms_url
  end
end
