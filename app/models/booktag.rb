class Booktag < ActiveRecord::Base
  belongs_to :book
  belongs_to :tag
end
