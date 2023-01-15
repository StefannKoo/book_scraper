class CreateScans < ActiveRecord::Migration[7.0]
  def change
    create_table :scans do |t|
      t.datetime :date
      t.timestamps
    end
    add_reference :scans, :publisher, null: false, foreign_key: true
  end
end
