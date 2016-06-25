# coding: utf-8
require 'test_helper'

class TagInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hiro)
    @tag = tags(:Ruby)
  end

  test 'tag interface test' do
    log_in_as(@user)
    
    get new_tag_path
    assert_template 'tags/new'
    
    # 登録のテスト
    tag = 'foobar'
    
    assert_difference 'Tag.count', 1 do
      post tags_path, tag: { name: tag }
    end
    
    follow_redirect!
    assert_template 'tags/index'
    assert_select 'a', text: '編集'
    assert_select 'a', text: '削除'

    # 更新のテスト
    get edit_tag_path(@tag)
    assert_template 'tags/edit'
    
    tag = 'hogehoge'

    patch tag_path, tag: { name: tag }

    @tag.reload
    assert_equal tag, @tag.name

    follow_redirect!
    assert_template 'tags/index'

    # 削除のテスト
    get tags_path
    assert_template 'tags/index'

    assert_difference 'Tag.count', -1 do
      delete tag_path(@tag)
    end

    follow_redirect!
    assert_template 'tags/index'
  end
end
