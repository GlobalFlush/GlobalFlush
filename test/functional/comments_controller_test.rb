require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "post no user" do
	assert_difference('Post.count') do
		post :create, :comment => { :bathroom_id => 1, :body => "I shouldn't be here.", :smell => 1, :clean => 1, :overall =>1}
	end
	assert_redirected_to login_url
  end
  
  test "login and post" do
	https!
	get "/login"
	assert_response :success
	
	
	post_via_redirect "/login", :login => "Asparagus", :password => "vegetable"
	assert_equal '/', path
	
	assert_difference('Post.count') do
		post :create, :comment => { :bathroom_id => 1, :body => "Test, test!", :smell => 5, :clean => 5, :overall =>5}
	end
	assert_redirected_to "/bathrooms/1"
	
  end
end
