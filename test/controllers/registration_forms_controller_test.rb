require "test_helper"

class RegistrationFormsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = create(:user)
    @registration_form = create(:registration_form)
  end

  test "should get index" do
    sign_in @user
    get registration_forms_path
    assert_response :success
  end

  test "should get edit" do
    get edit_registration_form_url(@registration_form)
    assert_response :success
  end
end
