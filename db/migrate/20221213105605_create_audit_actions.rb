class CreateAuditActions < ActiveRecord::Migration[7.0]
  def change
    create_table :audit_actions do |t|
      t.string :message
      t.references :price, null: false, foreign_key: true
      t.references :audit_price, null: false, foreign_key: true
      t.references :audit, null: false, foreign_key: true
      t.timestamps
    end
  end
end
