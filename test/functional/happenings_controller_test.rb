require 'test_helper'

class HappeningsControllerTest < ActionController::TestCase
  setup do
    @happening = happenings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:happenings)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect 
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:bill)
    get :new
    assert_response :success
  end

  test "should get edit when logged in" do 
    sign_in users(:bill)
    get :edit, :id => @happening
    assert_response :success
  end

  test "should redirect happening update when not logged in" do 
    put :update, :id => @happening, :happenings => { :content => @happening.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end


  test "should be logged in to post a happening" do 
    post :create, :happenings => { :content => "Hello" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create happening when logged in" do
    sign_in users(:bill)

    assert_difference('Happening.count') do
      post :create, :happening => { :content => @happening.content }
    end

    assert_redirected_to happening_path(assigns(:happening))
  end

  test "should create happening for the current user when logged in" do
    sign_in users(:bill)

    assert_difference('Happening.count') do
      post :create, :happening => { :content => @happening.content, :user_id => users(:fin).id }
    end

    assert_redirected_to happening_path(assigns(:happening))
    assert_equal assigns(:happening).user_id, users(:bill).id
  end

  test "should show happening" do
    get :show, :id => @happening
    assert_response :success
  end

  test "should update happening when logged in" do
    sign_in users(:bill)
    put :update, :id => @happening, :happening => { :content => @happening.content }
    assert_redirected_to happening_path(assigns(:happening))
  end

  test "should update happening for current user when logged in" do
    sign_in users(:bill)
    put :update, :id => @happening, :happening => { :content => @happening.content, :user_id => users(:fin).id }

    assert_redirected_to happening_path(assigns(:happening))
    assert_equal assigns(:happening).user_id, users(:bill).id
  end

  test "should not update happening if nothing has changed" do
    sign_in users(:bill)
    put :update, :id => @happening
    assert_redirected_to happening_path(assigns(:happening))
    assert_equal assigns(:happening).user_id, users(:bill).id
  end

  test "should destroy happening" do
    assert_difference('Happening.count', -1) do
      delete :destroy, :id => @happening
    end

    assert_redirected_to happenings_path
  end
end
