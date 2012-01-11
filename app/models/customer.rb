class Customer < ActiveRecord::Base
    has_many :cars
    has_many :bookings

    validates_length_of :first_name, :minimum =>1, :too_short => "To short first name. Must be at least 1 symbol !"
    validates_length_of :last_name, :minimum =>1, :too_short => "To short last name. Must be at least 1 symbol !"
    validates_length_of :email, :minimum =>1, :too_short => "To short email address. Must be at least 1 symbol !"
    validates_length_of :address, :minimum =>1, :too_short => "To short address. Must be at least 1 symbol !"

    validates_presence_of :gender, :phone_number

    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

#\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b
#^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,6}$
end
