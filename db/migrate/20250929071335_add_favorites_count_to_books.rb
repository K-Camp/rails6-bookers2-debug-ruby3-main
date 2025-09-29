class AddFavoritesCountToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :favorites_count, :integer, default: 0, null: false
  end
end
