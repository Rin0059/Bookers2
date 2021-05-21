class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    end
  end

  def index
    @book = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @users = @book.users
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book
  end

  private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end
end
