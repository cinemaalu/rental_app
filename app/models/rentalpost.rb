
class Rentalpost < ActiveRecord::Base
attr_accessible :addrl1, :addrl2, :city, :contactpref, :country, :price, :rental_desc, :rentaltype, :state, :status

	belongs_to :user
	
  validates :rental_desc, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true

  default_scope order: 'rentalposts.created_at DESC'
end
