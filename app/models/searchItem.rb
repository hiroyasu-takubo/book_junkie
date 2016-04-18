# coding: utf-8
class SearchItem
  # プロパティの設定
  attr_accessor :title, :author, :pubilisher, :image

  def initialize(title, author, publisher, image)
    @title = title
    @author = author
    @publisher = publisher
    @image = image
  end
end
