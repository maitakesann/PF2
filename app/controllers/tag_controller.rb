class TagController < ApplicationController
  def index
    @books = Tag.find(params[:id]).books
  end
end
