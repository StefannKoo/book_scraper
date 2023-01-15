class CreatePublisherPlatforms < ActiveRecord::Migration[7.0]
  def change
    create_table :publisher_platforms do |t|
      t.references :publisher, null: false, foreign_key: true
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
