class CreateTerritories < ActiveRecord::Migration[7.0]
  def change
    create_table :territories do |t|
      t.string :name
      t.string :currency

      t.timestamps
    end
  end
end
