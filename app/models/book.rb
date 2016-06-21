# coding: utf-8
class Book < ActiveRecord::Base
  belongs_to :user
  has_many :tags, through: :booktags, dependent: :destroy
  has_many :booktags, dependent: :destroy
  validates :user_id, presence: true
  # validates :asin, presence: true, uniqueness: { case_sensitive: true }
end
