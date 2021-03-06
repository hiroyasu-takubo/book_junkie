# coding: utf-8
class TagSearchController < ApplicationController
  before_action :logged_in_user, only: [:new, :index]
  
  def new
  end

  def index
    tag = Tag.find_by(id: params[:tag_search][:tag_ids])
    
    if tag.books.exists?
      @books = tag.books
      render 'index'
    else
      flash[:danger] = 'タグに関連する本がありません。'
      render 'new'
    end
  end
end
