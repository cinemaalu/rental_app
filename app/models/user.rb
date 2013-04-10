# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  mi_name    :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  phone1     :integer
#  phone2     :integer
#  phone3     :integer
#  addr1      :string(255)
#  addr2      :string(255)
#  city       :string(255)
#  state      :string(255)
#  country    :string(255)
#  uri        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
			
attr_accessible :first_name, :last_name, :mi_name, :phone1, :phone2, :phone3, :email, :password, :password_confirmation, :addr1, :addr2, :city, :country, :state, :uri
	has_secure_password
	has_many :rentalposts, dependent: :destroy

	before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 75 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

	validates :addr1, presence: true, length: { maximum: 50 }
	validates :city, presence: true, length: { maximum: 50 }
	validates :state, presence: true, length: { maximum: 50 }
	validates :country, presence: true, length: { maximum: 50 }

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Rentalpost.where("user_id = ?", id)
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
