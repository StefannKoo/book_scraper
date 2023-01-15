class AddDetailsToBooksPlatforms < ActiveRecord::Migration[7.0]
  def change
    add_column :platform_books, :name, :string
    add_column :platform_books, :url, :string
    add_column :platform_books, :image, :string
  end
end
