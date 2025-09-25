class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    # 元のページに戻る、元ページのURLがない場合はbooks_pathへ
    redirect_back(fallback_location: books_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    # 元のページに戻る、元ページのURLがない場合はbooks_pathへ
    redirect_back(fallback_location: books_path)
  end
end
