require 'test_helper'

class BoardsControllerTest < ActionController::TestCase
  test "should not get index before login" do
    get :index
    assert_response :unauthorized
  end

  test "should not post edit before login" do
    post :edit, id: 1
    assert_response :unauthorized
  end

  test "should not get new before login" do
    post :new
    assert_response :unauthorized
  end

  test "should not post delete before login" do
    post :delete, id: 1
    assert_response :unauthorized
  end

  # test "current user should be nil before sign in" do
  #   assert "Current user is not nl, #{@current_user.inspect}", @current_user == nil?
  # end

  # test "current user should exist after sign in" do
  #   @current_user = User.find(1)
  #   assert "Current user is nil, #{@current_user.inspect}", @current_user != nil?
  # end

  # test "should get index after login" do
  #   @current_user = User.find(1)
  #   get :index
  #   assert_response :success
  # end

  # test "should post edit after login" do
  #   @current_user = User.find(1)
  #   post :edit, id: 1
  #   assert_response :success
  # end

  # test "should get new after login" do
  #   @current_user = User.find(1)
  #   post :new
  #   assert_response :success
  # end

  # test "should post delete after login" do
  #   @current_user = User.find(1)
  #   post :delete, id: 1
  #   assert_response :success
  # end
end
