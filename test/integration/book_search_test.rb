require 'test_helper'

class BookSearchTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hiro)
    @tag = tags(:Ruby)
  end
  
  test 'should render new when keyword is blank' do
    log_in_as(@user)

    get new_search_path
    assert_template 'searches/new'
    
    get searches_path, search: { keyword: '' }

    assert_not flash.empty?    
    assert_template 'searches/new'
  end

  test 'should render index' do
    log_in_as(@user)

    get new_search_path
    assert_template 'searches/new'
    
    get searches_path, search: { keyword: 'Ruby' }

    assert flash.empty?    
    assert_template 'searches/index'
  end  
end
