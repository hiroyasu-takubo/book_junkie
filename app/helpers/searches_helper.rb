module SearchesHelper
  def search_to_hash(search)
    {asin: search.asin,
     title: search.title ,
     author: search.author,
     publisher: search.publisher,
     image: search.image,
     keyword: '',
    }
  end
end
