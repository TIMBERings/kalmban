require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "should not get index before login" do
    get :index, board_id: 1
    assert_response :unauthorized
  end

  test "should not get show before login" do
    get :show, board_id: 1, id: 1
    assert_response :unauthorized
  end

  test "should not get new before login" do
    get :new, board_id: 1
    assert_response :unauthorized
  end

  test "should not get edit before login" do
    get :edit, board_id: 1, id: 1
    assert_response :unauthorized
  end

  test "should not get delete before login" do
    get :delete, board_id: 1, id: 1
    assert_response :unauthorized
  end

  # test "current user should be nil before sign in" do
  #   assert "Current user is not nl, #{@current_user.inspect}", @current_user == nil?
  # end

  # test "current user should exist after sign in" do
  #   @current_user = User.find(1)
  #   assert "Current user is nil, #{@current_user.inspect}", @current_user != nil?
  # end

end
