require 'test_helper'

class BookCreateTest < ActionDispatch::IntegrationTest

  def setup
      @user = users(:michael)
  end

  test 'should create book' do
    log_in_as(@user)
    get new_book_path
    assert_template 'books/new'

    assert_difference 'Book.count', 1 do
      post book_path, book: { asin: '',
                              title: 'Ruby book',
                              author: 'foo',
                              publisher: 'test company',
                              image: 'aaa',
                            }
    end
    assert_template 'books/show'
  end

  test 'should create book' do
    log_in_as(@user)
    get new_book_path
    assert_template 'books/new'

    assert_difference 'Book.count', 1 do
      post book_path, book: { asin: '',
                              title: 'Ruby book',
                              author: 'foo',
                              publisher: 'test company',
                              image: 'aaa',
                            }
    end
    assert_template 'books/show'
  end
    
  end

  test "unsuccesful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "foo@invalid",
                                    password:              "foo",
                                    password_confirmation: "bar" }
    assert_template 'users/edit'
    
  end

end
