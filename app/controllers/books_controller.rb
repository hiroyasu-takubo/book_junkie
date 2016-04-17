# coding: utf-8
class BooksController < ApplicationController
  # before_action :logged_in_user, only: [:new, :index]
  
  def index
    item_name = params[:book][:keyword]

    if item_name.blank?
      flash.now[:danger] = '本の名前を入力してください'
      render 'new'
    else
      @res = Amazon::Ecs.item_search(item_name,
                                     :search_index   => 'Books',
                                     :response_group => 'Medium',
                                     :country        => 'jp'
                                    )
    end
  end

  def new
  end

  def booksearch
  end

end
