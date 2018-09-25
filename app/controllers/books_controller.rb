class BooksController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def index
    @books = Book.all
    render_paginated json: @books
  end
end
