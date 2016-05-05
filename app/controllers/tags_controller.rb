# coding: utf-8
class TagsController < ApplicationController

  def new
    @tag = Tag.new
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "タグが作成されました。"
      redirect_to tags_url
    else
      flash[:danger] = "タグの作成が失敗しました。"
      render 'new'
    end
  end

  def index
    @tags = Tag.where(user_id: current_user.id)
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(tag_params)
      flash[:success] = "タグを変更しました。"
      redirect_to tags_url
    else
      flash[:danger] = "タグの変更に失敗しました。"
      render 'edit'
    end
  end

  def destroy
    Tag.find(params[:id]).destroy
    flash[:success] = "タグを削除しました。"
    redirect_to tags_url
  end
 
  private

  def tag_params
    params.require(:tag).permit(:user_id, :name)
  end
end
