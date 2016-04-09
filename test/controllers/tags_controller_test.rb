# coding: utf-8
require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  def setup
    @tag = tags(:Haskell)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag
    assert_response :success
  end

  test "should render edit when update fail" do
    patch :update, id: @tag, tag: { name:"" }
    assert_not flash.empty?
    assert_template "tags/edit"
  end

  test "should redirect index when update success" do
    patch :update, id: @tag, tag: {name:"hoge" }
    assert_not flash.empty?
    assert_redirected_to '/tags'
  end

  test "should render create when create fail" do
    post :create, tag: { use_id: 1,
                         name: "" }
    assert_not flash.empty?
    assert_template "tags/new"
  end

  test "should redirect index when create success" do
    post :create, tag: { user_id: 1,
                         name: "python" }
    assert_not flash.empty?
    assert_redirected_to "/tags"
  end

end
