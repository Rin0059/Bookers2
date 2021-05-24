class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @users = User.all
  end

  def index
    @users = User.all
    @user = current_user
  end

  def create
    @user = User.new
    @users = User.all
    if @user.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@user.id)
    else
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
      render :index
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
