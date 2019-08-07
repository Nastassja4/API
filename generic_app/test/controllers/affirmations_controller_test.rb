require 'test_helper'

class AffirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get affirmations_new_url
    assert_response :success
  end

  test "should get create" do
    get affirmations_create_url
    assert_response :success
  end

  test "should get show" do
    get affirmations_show_url
    assert_response :success
  end

  test "should get update" do
    get affirmations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get affirmations_destroy_url
    assert_response :success
  end

end
