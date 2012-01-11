class Mechanic < ActiveRecord::Base
    has_and_belongs_to_many :bookings

    validates_length_of :mechanic_name, :minimum =>1, :too_short => "To short name"

    validates_presence_of :phone_number
    #, :booking_id
end
