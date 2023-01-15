class CreatePlatformBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :platform_books do |t|
      t.references :platform, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
