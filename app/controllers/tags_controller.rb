# coding: utf-8
class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "タグが作成されました。"
      redirect_to tags_url
    else
      flush[:danger] = "タグの作成が失敗しました。"
      render new_tag_url
    end
  end

  def index
    @tags = Tag.all
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def destroy
    Tag.find(params[:id]).destroy
    flash[:success] = "タグを削除しました。"
    redirect_to tags_url
  end
 
  private

  def tag_params
    params.require(:tag).permit(:user_id, :tag_name)
  end
end
