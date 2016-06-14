require 'test_helper'

class TagInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hiro)
  end

  test 'should create tag' do
    log_in_as(@user)
    get new_tag_path
    assert_template 'tags/new'
    assert_difference 'Tag.count', 1 do
      post tag_path, tag: { name: 'foobar'}
    end
    assert_template 'books/show'
  end

  test 'should update tag' do
    log_in_as(@user)
    get new_tag_path
    assert_template 'tags/new'
    assert_difference 'Tag.count', 1 do
      post tag_path, tag: { name: 'foobar'}
    end
    assert_template 'books/show'
  end


end
