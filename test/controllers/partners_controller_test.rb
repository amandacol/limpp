require 'test_helper'

class PartnersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get partners_new_url
    assert_response :success
  end

  test "should get create" do
    get partners_create_url
    assert_response :success
  end

end
