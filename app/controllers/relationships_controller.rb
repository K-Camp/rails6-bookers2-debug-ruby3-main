class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    # 元のページに戻る、元ページのURLがない場合はbooks_pathへ
    redirect_back(fallback_location: books_path)
  end

  def destroy
  end
end
