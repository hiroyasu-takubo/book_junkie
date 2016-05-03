class Book < ActiveRecord::Base
  has_many :booktags
  belongs_to :user
end
