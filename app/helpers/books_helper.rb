# coding: utf-8
module BooksHelper

  def books_search(itemParams)
    if itemParams.blank?
      flash.now[:danger] = 'パラメータが間違っています。入力値を確認してください。'
      nil
    else
      @res = Amazon::Ecs.item_search(itemParams[:item],
                                     :search_index   => 'Books',
                                     :response_group => itemParams[:response_group],
                                     :country        => itemParams[:country]
                                    )
      @res
    end
  end

  def books_jp_search(itemParams)
    itemParams.store(:country, 'jp')
    books_search(itemParams)
  end
end
