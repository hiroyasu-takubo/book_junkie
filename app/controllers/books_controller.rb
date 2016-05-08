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
    # TODO 検索方法を帰る。create_orupdateがいい？ 検索ならasinがいい。
    # TODO タグの削除方法の設計
    @book = Book.find_by(title: book_params[:title], user_id: current_user.id)
    
    if @book.blank?
      @book = Book.new(book_params)
      
      unless @book.save
        flash[:danger] = "登録が失敗しました。"
        render 'new'
      end
    end
    
    tag_ids = params[:tag][:tag_ids].select(&:present?)
    
    tag_all = Tag.find_by(user_id: current_user.id, name: 'all')
    tag_ids << tag_all[:id].to_s
    
    tag_hashkey = [:tag_id] * tag_ids.size
    tag_hash_array = tag_hashkey.collect.zip(tag_ids)
    tag_hash = []
    tag_hash_array.each { |h| tag_hash << Hash[*h]}
    
    @booktags = @book.booktags.build(tag_hash)
    
    @booktags.each do |booktag|
      unless booktag.save
        render 'new'
      end
    end
    
    flash[:success] = "本を登録しました。"
    redirect_to @book
  end

  def show
    @book = Book.find(params)
  end

  def index
    @user = User.find_by( id: current_user.id)
    @books = @user.books.paginate(page: params[:page])
  end

  private

  def book_params
    params.require(:book).permit(:title,:author, :publisher, :image, { tag_ids: [] })
  end

end
