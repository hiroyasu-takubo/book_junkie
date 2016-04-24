require 'test_helper'

class BookSearchTest < ActionDispatch::IntegrationTest

  test "book search failes when word is not filled in" do
    get new_search_path
    assert_template 'searches/new'
    get searches_path, search: { keyword: "" }
    assert_template 'searches/new'
    assert_not flash.empty?
  end
end
