# coding: utf-8
class Search
  include ActiveModel::Model
  # プロパティの設定
  attr_accessor :title, :author, :publisher, :image, :keyword
end
