# coding: utf-8
require 'open-uri'
require 'FileUtils'
class Book < ActiveRecord::Base
  belongs_to :user
  has_many :tags, through: :booktags, dependent: :destroy
  has_many :booktags, dependent: :destroy
  mount_uploader :image, PictureUploader
  validates :user_id, presence: true
  validates :asin, presence: true, uniqueness: { case_sensitive: true }
  validates :image_size
  
  public

  def save_image(url)
    file_name = File.basename(url) + '.jpg'
    dir_name = '/Users/yukiikeda/desktop/img/'
    file_path = dir_name + file_name
    FileUtils.mkdir_p(dir_name) unless FileTest.exist?(dir_name)
    open(file_path, 'wb') do |output|
      open(url) do |data|
        output.write(data.read)
      end
    end
  end
  
  private

  def image_size
    if image.size > 5.megabytes 
      errors.add(:image, "画像のサイズは5MB以下にしてください。")
    end
  end
end
