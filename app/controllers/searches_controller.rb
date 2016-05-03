# coding: utf-8
class SearchesController < ApplicationController
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
      res = Amazon::Ecs.item_search(searchword,
                                     :search_index   => 'Books',
                                     :response_group => 'Medium',
                                     :country        => 'jp'
                                     )
      @searches = []
      res.items.each do |item|
        search = Search.new({title: item.get('ItemAttributes/Title'),
                             author: item.get('ItemAttributes/Author'),
                             publisher: item.get('ItemAttributes/Publisher'),
                             image: item.get('MediumImage/URL'),
                             keyword: searchword
                            })
        @searches << search
      end
    end
  end

  def new
    @search = Search.new(title: '',
                         author: '',
                         publisher: '',
                         image: '',
                         keyword: '')
  end

  def search_detail
  end
end
