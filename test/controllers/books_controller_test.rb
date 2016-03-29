require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "the truth" do
    assert true
    get :new
    assert_response :success
  end

end
