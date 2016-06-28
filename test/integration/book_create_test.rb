# coding: utf-8
require 'test_helper'

class BookCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:hiro)
    @book = books(:Ruby)
  end

  test 'should create book' do
    log_in_as(@user)
    
    get new_book_path, search: { asin: '333',
                                 title: 'Ruby',
                                 author: 'author',
                                 publisher: 'publisher',
                                 image: 'http://dummyimage.com/100x100.jpg'
                               }
    assert_template 'books/new'
    
    assert_difference 'Book.count', 1 do
      post_via_redirect books_path, book: { asin: '333',
                                            title: 'Ruby',
                                            author: 'author',
                                            publisher: 'publisher',
                                            image:  'http://dummyimage.com/100x100.jpg'
                                          }
    end
    assert_template 'books/show'
  end

  test 'should fail to create invalid book' do
    log_in_as(@user)
    
    get new_book_path, search: { asin: '111',
                                 title: 'Ruby',
                                 author: 'author',
                                 publisher: 'publisher',
                                 image: 'http://dummyimage.com/100x100.jpg'
                               }
    assert_template 'books/new'
    
    # asin unique invalid
    assert_no_difference 'Book.count' do
      post_via_redirect books_path, book: { asin: 'a111',
                                            title: 'Ruby',
                                            author: 'author',
                                            publisher: 'publisher',
                                            image:  'http://dummyimage.com/100x100.jpg'
                                          }
    end
    assert_template 'books/new'

    # asin presence invalid
    assert_no_difference 'Book.count' do
      post_via_redirect books_path, book: { asin: '',
                                            title: 'Ruby',
                                            author: 'author',
                                            publisher: 'publisher',
                                            image:  'http://dummyimage.com/100x100.jpg'
                                          }
    end
    assert_template 'books/new'
   
  end

  test 'should search book' do
    log_in_as(@user)

    get new_search_path
    assert_template 'searches/new'

    get searches_path, search: { keyword: 'Ruby' }
    assert_template 'searches/index'

    # TODO 画面のリンクをクリックすることはできない？また別のフレームワークが必要？
    get new_book_path, search: { title: 'Ruby',
                                 author: 'author',
                                 publisher: 'publisher',
                                 image: 'http://dummyimage.com/100x100.jpg'
                               }
    assert_template 'books/new'
  end
end
