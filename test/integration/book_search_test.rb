require 'test_helper'

class BookSearchTest < ActionDispatch::IntegrationTest

  test "book search failes when word is not filled in" do
    get booksearch_path
    assert_template 'books/new'
    post booklist_path, book: { keyword: "" }
    assert_template 'books/new'
    assert_not flash.empty?
  end
end
