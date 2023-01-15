class PublisherPlatform < ApplicationRecord
  belongs_to :publisher
  belongs_to :platform
  validates :publisher_id,uniqueness: { scope: :platform_id,message:"Platform was added !" } #jedinstvena kombinacija
end
