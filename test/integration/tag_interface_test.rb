# coding: utf-8
require 'test_helper'

class TagInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hiro)
    @tag = tags(:Ruby)
  end

  test 'should create tag' do
    log_in_as(@user)
    
    get new_tag_path
    assert_template 'tags/new'
    
    assert_difference 'Tag.count', 1 do
      post tags_path, tag: { name: 'foobar'}
    end
    
    follow_redirect!
    assert_template 'tags/index'
  end

  test 'should fail to create tag' do
    log_in_as(@user)

    get new_tag_path
    assert_template 'tags/new'

    assert_no_difference 'Tag.count' do
      post tags_path, tag: { name: ''}
    end

    assert_template 'tags/new'
  end
  
  test 'should update tag' do
    log_in_as(@user)
    
    get tags_path
    assert_template 'tags/index'
    assert_select 'a', text: '編集'
    
    get edit_tag_path(@tag)
    assert_template 'tags/edit'

    tag = 'foobar'

    patch tag_path, tag: { name: tag }

    @tag.reload
    assert_equal tag, @tag.name

    assert_template 'tags/index'
  end

  test 'should fail to update tag' do
    log_in_as(@user)

    get tags_path
    assert_template 'tags/index'

    get edit_tag_path(@user)
    assert_template 'tags/edit'

    patch tag_path, tag: { name: '' }

    assert_template 'tags/edit'
  end

  test 'should destroy tag' do
    log_in_as(@user)

    get tags_path
    assert_template 'tags/index'
    assert_select 'a', text: '削除'

    assert_difference 'Tag.count', -1 do
      delete tag_path(@tag)
    end
    assert_template 'tags/edit'
  end 
end
