require 'test_helper'

class BooksControllerTest < ActionController::TestCase

  def new
    @book = Book.new
  end
end
