class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @book.id)
    @favorite.save

    # 呼び出し元で表示範囲を切り替え
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @books = @user.books.order(favorites_count: :desc)
    else
      @user = nil
      @books = Book.order(favorites_count: :desc)
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy

    # 呼び出し元で表示範囲を切り替え
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @books = @user.books.order(favorites_count: :desc)
    else
      @user = nil
      @books = Book.order(favorites_count: :desc)
    end

    respond_to do |format|
      format.js
    end
  end
end
