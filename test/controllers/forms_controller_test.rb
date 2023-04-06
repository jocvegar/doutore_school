require "test_helper"

class FormsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = create(:user)
  end

  test "should not get index" do
    get root_path
    assert_response :redirect
  end

  test "should get index" do
    sign_in @user
    get root_path
    assert_response :success
  end
end
