# coding: utf-8
class BooksController < ApplicationController
  # before_action :logged_in_user, only: [:new, :index]
  
  def index
    item_name = params[:book][:keyword]

    if item_name.blank?
      flash.now[:danger] = '本の名前を入力してください'
      render 'new'
    else
      Amazon::Ecs.configure do |options|
      options[:AWS_access_key_id] = ENV["AWS_ACCESS_KEY_ID"]
      options[:AWS_secret_key]    = ENV["AWS_SECRET_KEY"]
      options[:associate_tag]     = ENV["ASSOCIATE_ID"]
      end

      @res = Amazon::Ecs.item_search(item_name,
                                     :search_index   => 'Books',
                                     :response_group => 'Medium',
                                     :country        => 'jp'
                                    )
    end
  end


  def new
  end

end
