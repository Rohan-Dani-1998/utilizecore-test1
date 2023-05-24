class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
	validates :name, presence: true

	has_one :address
	has_many :send_parcels, foreign_key: :sender_id, class_name: 'Parcel'
	has_many :received_parcels, foreign_key: :receiver_id, class_name: 'Parcel'

	accepts_nested_attributes_for :address
    after_create :save_address, unless: :address

    def save_address
        Address.create(
            user_id: self.id,
            address_line_one: "Test",
            address_line_two: nil,
            city: "Test",
            state: "Test",
            country: "India",
            pincode: "112233",
            mobile_number: "9900990099"
        )
    end

	def name_with_address
		@name_with_address ||= [name, address.address_line_one, address.city, address.state, address.country, address.mobile_number, address.pincode].join('-')
	end
end
