require 'test_helper'

class BuoysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buoys_index_url
    assert_response :success
  end

  test "should get new" do
    get buoys_new_url
    assert_response :success
  end

  test "should get create" do
    get buoys_create_url
    assert_response :success
  end

  test "should get show" do
    get buoys_show_url
    assert_response :success
  end

end
