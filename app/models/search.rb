# coding: utf-8
class Search
  include ActiveModel::Model
  # プロパティの設定
  attr_accessor :title, :author, :publisher, :image, :keyword
  validates :keyword, presence: true
  public
  def book_search(searchword, search_index = 'Books', response_group = 'Medium',
                  country = 'jp')
    res = Amazon::Ecs.item_search(searchword,
                                  search_index: search_index,
                                  response_group: response_group,
                                  country: country
                                 )
    res
  end

  def search_result(res)
    @searches = []
    res.items.each do |item|
      search = Search.new({title: item.get('ItemAttributes/Title'),
                           author: item.get('ItemAttributes/Author'),
                           publisher: item.get('ItemAttributes/Publisher'),
                           image: item.get('MediumImage/URL'),
                          })
      @searches << search
    end
    @searches
  end
end
