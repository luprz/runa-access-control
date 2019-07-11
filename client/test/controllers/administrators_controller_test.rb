require 'test_helper'

class AdministratorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrators_index_url
    assert_response :success
  end

  test "should get show" do
    get administrators_show_url
    assert_response :success
  end

  test "should get new" do
    get administrators_new_url
    assert_response :success
  end

  test "should get create" do
    get administrators_create_url
    assert_response :success
  end

  test "should get edit" do
    get administrators_edit_url
    assert_response :success
  end

  test "should get update" do
    get administrators_update_url
    assert_response :success
  end

  test "should get destroy" do
    get administrators_destroy_url
    assert_response :success
  end

end
