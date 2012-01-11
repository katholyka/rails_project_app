class Model < ActiveRecord::Base
    belongs_to :manufacturer
    has_many :cars

    #validates_existence_of :manufacturer

    validates_length_of :model_name, :minimum =>1, :too_short => "To short name"

    validates_presence_of :date_create
end 
