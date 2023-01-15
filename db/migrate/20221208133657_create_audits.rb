class CreateAudits < ActiveRecord::Migration[7.0]
  def change
    create_table :audits do |t|
      t.string :image
      t.string :price
      t.references :platform_book, null: false, foreign_key: true
      t.references :scan, null: false, foreign_key: true
      t.timestamps
    end
  end
end
