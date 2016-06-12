require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  def setup
    @book = books(:Ruby)
    @user = users(:hiro)
    @other_user = users(:archer)
  end
  
  test 'should get new' do
    assert true
    get :new
    assert_template 'new'
  end

  test 'should get edit' do
    assert true
    get :new
    assert_template 'edit'
  end

  test 'should get index' do
    assert true
    get :index, search: { keyword: '' }
    assert_response :success
  end

  test 'should redirect new when not logged in' do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect edit when not logged in' do
    get :edit, id: @book
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Book.count' do
      delete :destroy, id: @book
    end
    assert_redirected_to login_url
  end

  test 'should redirect create when logged in as wrong user' do
    log_in_as @other_user
    post :create ,book: { asin: '',
                          title: 'Ruby book',
                          author: 'foo',
                          publisher: 'test company',
                          image: 'aaa',
                        }
    assert_redirect_to root_url
  end

  test 'should redirect update when logged in as wrong user' do
    log_in_as @other_user
    patch :update ,book: { asin: '',
                          title: 'Ruby book',
                          author: 'foo',
                          publisher: 'test company',
                          image: 'aaa',
                        }
    assert_redirect_to root_url
  end
  
  test 'should redirect destroy when logged in as wrong user' do
    log_in_as @other_user
    assert_no_difference 'Book.count' do
      post :destroy ,id: @book
    end
    assert_redirect_to root_url
  end
  
  # test 'should get show' do
  #   assert true
  #   get :show, @book
  #   assert_response :success
  # end
  
end
