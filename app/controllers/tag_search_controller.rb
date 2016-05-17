# coding: utf-8
class TagSearchController < ApplicationController
  def new
  end

  def create
    # tag = Tag.find_by(name: params[:tag_search][:name])
    
    # if tag.books.exists?
    #   flash[:danger] = 'タグに関連する本がありません。'
    #   render 'new'
    # else
    #   @books = tag.books
    #   redirect_to 'index'
    # end
    render text: params
  end
end
