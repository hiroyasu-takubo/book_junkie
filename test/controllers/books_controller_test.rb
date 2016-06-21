# coding: utf-8
require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  def setup
    @book = books(:Ruby)
    @user = users(:hiro)
    @otheruser = users(:archer)
  end
  
  test 'should get new' do
    log_in_as(@user)
    get :new, search: { title: 'Ruby',
                        author: 'author',
                        publisher: 'publisher',
                        image: 'http://dummyimage.com/100x100.jpg'
                      }
    assert_template 'new'
  end

  test 'should redirect new when not logged in' do
    get :new, search: { title: 'Ruby',
                        author: 'author',
                        publisher: 'publisher',
                        image: 'http://dummyimage.com/100x100.jpg'
                      }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
 
  test 'should get edit' do
    log_in_as(@user)
    get :edit ,id: @book
    assert_template 'edit'
  end

  test 'should redirect edit when not logged in' do
    get :edit, id: @book
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should get index' do
    log_in_as(@user)
    get :index, search: { keyword: '' }
    assert_response :success
  end

  test 'should redirect index when not logged in' do
    get :index, search: { keyword: '' }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect destroy when logged in as wrong user' do
    log_in_as @otheruser
    assert_no_difference 'Book.count' do
      post :destroy ,id: @book
    end
    assert_redirected_to root_url
  end
end
