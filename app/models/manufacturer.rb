class Manufacturer < ActiveRecord::Base
    has_many :models

    validates_length_of :manufacturer_name, :minimum =>1, :too_short => "To short name"

    validates_presence_of :manufacturer_name
end
