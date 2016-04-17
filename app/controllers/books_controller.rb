# coding: utf-8
class BooksController < ApplicationController
  # before_action :logged_in_user, only: [:new, :index]
  
  def index
    item_name = params[:book][:keyword]

    if item_name.blank?
      flash.now[:danger] = '本の名前を入力してください'
      render 'new'
    else
     res = Amazon::Ecs.item_search(item_name,
                                     :search_index   => 'Books',
                                     :response_group => 'Medium',
                                     :country        => 'jp'

                                     )
      @books = []
      res.items.each do |item|
        book = Book.new
        book.title = item.get('ItemAttributes/Title')
        book.author = item.get('ItemAttributes/Author')
        book.publisher = item.get('ItemAttributes/Publisher')
        book.image = item.get('MediumImage/URL')

        @books << book
      end
    end
  end

  def new
  end

  def show
    @book = Book.new
    
    book.title = params[:title]
    book.author = params[:author]
    book.publisher = params[:publisher]
    book.image = params[:image]
  end

  def booksearch
  end

end
