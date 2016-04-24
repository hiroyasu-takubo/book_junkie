# coding: utf-8
class SearchesController < ApplicationController
  def index
    searchword = params[:search][:keyword]

    if searchword.blank?
      flash.now[:danger] = '本の名前を入力してください'
      # DBと紐付いている時は必要なかった。初期化しない方法はある？
      @search = Search.new("",
                           "",
                           "",
                           "",
                           "")
      render 'new'
    else
      res = Amazon::Ecs.item_search(searchword,
                                     :search_index   => 'Books',
                                     :response_group => 'Medium',
                                     :country        => 'jp'
                                     )
      @searches = []
      res.items.each do |item|
        search = Search.new(
          item.get('ItemAttributes/Title'),
          item.get('ItemAttributes/Author'),
          item.get('ItemAttributes/Publisher'),
          item.get('MediumImage/URL'),
          searchword
        )
        @searches << search
      end
    end
    # render :text => params
    # render :text => params[:search][:keyword]
    # render :text => searchword
  end

  def new
    @search = Search.new("",
                         "",
                         "",
                         "",
                         "")
  end
end
