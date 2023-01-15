class LocationCandidate < ApplicationRecord
   belongs_to :platform_book,  dependent: :destroy
end
