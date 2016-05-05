# coding: utf-8
class BooksController < ApplicationController
  def new
    @book = Book.new(title: params[:search][:title],
                     author: params[:search][:author],
                     publisher: params[:search][:publisher],
                     image: params[:search][:image]
                    )

    @tags = Tag.where(user_id: current_user.id).where.not(name: 'all').order(id: :asc)
    @booktag = Booktag.new
  end

  def create
    # @book = Book.new(book_params)
    # if @book.save
    # else
    #   render 'new'
    # end
    
    # @booktags = @book.booktags.build(tag_params[:tag_ids])
    # @booktags << @book.booktags.build(name: 'all')
    
    # @booktags.each do |booktag|
    #   unless booktag.save
    #     render 'new'
    #   end
    # end
    
    # flash[:success] = "本を登録しました。"
    # redirect_to @book
    render text: params
  end

  def show
    @book = Book.find(params)
  end

  def book_params
    params.require(:book).permit(:title,:author, :publisher, :image)
  end

  def tags_params
    params.require(:book).permit({ tag_ids: [] })
  end
end
