# coding: utf-8
class Search
  include ActiveModel::Model
  # プロパティの設定
  attr_accessor :title, :author, :publisher, :image, :keyword

  def initialize(title, author, publisher, image, keyword)
    @title = title
    @author = author
    @publisher = publisher
    @image = image
    @keyword = keyword
  end
end
