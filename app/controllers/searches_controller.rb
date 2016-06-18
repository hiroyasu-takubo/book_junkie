# coding: utf-8
class SearchesController < ApplicationController
  before_action :logged_in_user, only: [:new, :index]
  
  def index
    searchword = params[:search][:keyword]

    if searchword.blank?
      flash.now[:danger] = '本の名前を入力してください'
      # DBと紐付いている時は必要なかった。初期化しない方法はある？
      @search = Search.new(title: '',
                           author: '',
                           publisher: '',
                           image: '',
                           keyword: '')
      render 'new'
    else
      search = Search.new
      res = search.book_search(searchword)
      @searches = search.search_result(res)
    end
  end

  def new
    @search = Search.new(title: '',
                         author: '',
                         publisher: '',
                         image: '',
                         keyword: '')
  end
end
