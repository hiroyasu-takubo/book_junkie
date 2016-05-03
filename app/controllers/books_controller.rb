# coding: utf-8
class BooksController < ApplicationController
  def new
    @book = Book.new(title: params[:search][:title],
                     author: params[:search][:author],
                     publisher: params[:search][:publisher],
                     image: params[:search][:image]
                    )

    @tags = Tag.where(user_id: current_user.id).order(id: :asc)
  end

  def create
    
  end
end
