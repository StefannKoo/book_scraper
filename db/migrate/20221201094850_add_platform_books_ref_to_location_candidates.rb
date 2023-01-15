class AddPlatformBooksRefToLocationCandidates < ActiveRecord::Migration[7.0]
  def change
    add_reference :location_candidates, :platform_book, null: false, foreign_key: true
  end
end
