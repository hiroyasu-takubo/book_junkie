require 'test_helper'

class BookCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:hiro)
    @book = books(:Ruby)
  end

  test 'should create book' do
    log_in_as(@user)
    
    get new_book_path, search: { title: 'Ruby',
                                 author: 'author',
                                 publisher: 'publisher',
                                 image: 'http://dummyimage.com/100x100.jpg'
                               }
    assert_template 'books/new'
    
    assert_difference 'Book.count', 1 do
      post_via_redirect books_path, book: { asin: '',
                                            title: 'Ruby',
                                            author: 'author',
                                            publisher: 'publisher',
                                            image:  'http://dummyimage.com/100x100.jpg'
                                          }
    end
    assert_template 'books/show'
  end
end
