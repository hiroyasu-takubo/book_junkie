class ShelvesController < ApplicationController

  def new
    @shelf = Shelf.new
  end

  # def create
  #   render
  # end
end
