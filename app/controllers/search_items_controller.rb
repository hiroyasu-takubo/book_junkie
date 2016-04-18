# coding: utf-8
class SearchItemsController < ApplicationController
  def index
    item_name = params[:searchitem][:keyword]

    if item_name.blank?
      flash.now[:danger] = '本の名前を入力してください'
      render 'new'
    else
      res = Amazon::Ecs.item_search(item_name,
                                     :search_index   => 'Books',
                                     :response_group => 'Medium',
                                     :country        => 'jp'
                                     )
      @search_items = []
      res.items.each do |item|
        search_item = SearchItem.new(
          item.get('ItemAttributes/Title'),
          item.get('ItemAttributes/Author'),
          item.get('ItemAttributes/Publisher'),
          item.get('MediumImage/URL')
        )
        @search_items << search_item
      end
    end
  end

  def new
  end

end
