require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, :id => users(:bill).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do 
  	get :show, :id => "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do 
  	get :show, :id => users(:bill).profile_name
  	assert assigns(:user)
  	assert !assigns(:happenings).empty?
  end

  test "only show the correct user's happenings" do 
  	get :show, :id => users(:bill).profile_name
  	assigns(:happenings).each do |happening|
  		assert_equal users(:bill), happening.user
  	end
  end

end
