class CreatePrices < ActiveRecord::Migration[7.0]
  create_enum :variants, ["hardcover", "e_book", "kindle", "paperback","audio_cd","text_book_binding","large_print","audio_book"]
  def change
    create_table :prices do |t|
      t.decimal :amount
      t.enum :variant, enum_type: "variants", null: false
      t.references :platform_book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
