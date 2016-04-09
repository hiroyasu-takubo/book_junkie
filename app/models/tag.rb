# coding: utf-8
class Tag < ActiveRecord::Base
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
end
