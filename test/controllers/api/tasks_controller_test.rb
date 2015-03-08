require 'test_helper'

class Api::TasksControllerTest < ActionController::TestCase
  test "should not get index without token" do
    get :index
    assert_response :unauthorized
  end

  test "should not get show without token" do
    get :show, id: 1
    assert_response :unauthorized
  end

  test "should not get new without token" do
    get :create
    assert_response :unauthorized
  end

  test "should not get edit without token" do
    get :update, id: 1
    assert_response :unauthorized
  end

  test "should not get delete without token" do
    get :destroy, id: 1
    assert_response :unauthorized
  end
end
