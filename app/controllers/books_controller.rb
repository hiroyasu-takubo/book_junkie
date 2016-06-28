# coding: utf-8
class BooksController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :index]
  before_action :correct_user, only: :destroy

  def new
    @book = Book.new(asin: params[:search][:asin],
                     title: params[:search][:title],
                     author: params[:search][:author],
                     publisher: params[:search][:publisher],
                     image: params[:search][:image]
                    )
    @user = User.find(current_user.id)
    @tags = @user.tags.order(id: :asc)
  end

  def create
    @user = User.find(current_user.id)
    @book = @user.books.build(book_params)
    if @book.save
      flash[:success] = "本を登録しました。"
      redirect_to @book
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
    @tags = @book.tags.all
  end

  def index
    @user = User.find_by(id: current_user.id)
    @books = @user.books.paginate(page: params[:page])
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    @tags = @user.tags.all
  end
    
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "本 #{@book.title}を更新しました"
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:asin, :title, :author, :publisher, :image, { tag_ids: [] })
  end

  def correct_user 
    @book = current_user.books.find_by(id: params[:id])
    redirect_to root_url if @book.nil?
  end
end
