# coding: utf-8
class Search
  include ActiveModel::Model
  # プロパティの設定
  attr_accessor :asin, :title, :author, :publisher, :image, :keyword
  public
  def book_search(searchword, search_index = 'Books', response_group = 'Medium',
                  country = 'jp')
    retry_count = 0
    begin
      res = Amazon::Ecs.item_search(searchword,
                                    search_index: search_index,
                                    response_group: response_group,
                                    country: country
                                   )
      res
    rescue
      retry_count += 1
      if retry_count < 5
        sleep(10)
        retry
      end
    end

  end

  def search_result(res)
    @searches = []
    res.items.each do |item|
      search = Search.new({asin: item.get('ASIN'),
                           title: item.get('ItemAttributes/Title'),
                           author: item.get('ItemAttributes/Author'),
                           publisher: item.get('ItemAttributes/Publisher'),
                           image: item.get('MediumImage/URL')
                          })
      @searches << search
    end
    @searches
  end
end
