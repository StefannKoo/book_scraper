class CreateAuditPrices < ActiveRecord::Migration[7.0]
  def change
    create_enum :variants, ["hardcover", "e_book", "kindle", "paperback","audio_cd","text_book_binding","large_print","audio_book"]

    create_table :audit_prices do |t|
      t.decimal :amount
      t.enum :variant, enum_type: "variants", null: false
      t.references :audit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
