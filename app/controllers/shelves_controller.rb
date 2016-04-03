# coding: utf-8
class ShelvesController < ApplicationController
  def new
    @shelf = Shelf.new
  end

  def create
    @shelf = Shelf.new(shelf_params)
    if @shelf.save
      flash[:success] = "本棚が作成されました。"
      redirect_to shelves_url
    else
      flush[:danger] = "本棚の作成が失敗しました。"
      render new_shelf_url
    end
  end

  def index
    @shelves = Shelf.all
  end

  def edit
    @shelf = Shelf.find(params[:id])
  end

  def destroy
    Shelf.find(params[:id]).destroy
    flash[:success] = "本棚を削除しました。"
    redirect_to shelves_url
  end
 
  private

  def shelf_params
    params.require(:shelf).permit(:user_id, :name)
  end

end
