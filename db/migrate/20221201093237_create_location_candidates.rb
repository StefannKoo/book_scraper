class CreateLocationCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :location_candidates do |t|
      t.string :name
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
