require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  test "should get new" do
    assert true
    get :new
    # assert_template 'new'
    assert_template 'new'
  end

  test "should get index" do
    assert true
    get :index, search: { keyword: "" }
    assert_response :success
  end
end
