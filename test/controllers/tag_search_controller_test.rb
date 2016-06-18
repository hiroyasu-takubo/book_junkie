# coding: utf-8
require 'test_helper'

class TagSearchControllerTest < ActionController::TestCase
  def setup
    @user = users(:hiro)
    @tag = tags(:Ruby)
  end
  
  test 'should render new' do
    log_in_as(@user)
    get :new
    assert_template 'new'
  end

  test 'should redirect new when not logged in' do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  # test 'should render index' do
  #   log_in_as(@user)
  #   # パラメータはどのように渡す？
  #   get :index, tag_search: { tag_ids: { id: @tag.id } }
  #   # get :index, @tag
  #   assert_template 'index'
  # end

  # test 'should redirect index when not logged in' do
  #   get :index
  #   assert_not flash.empty?
  #   assert_redirected_to login_url
  # end
  
end
