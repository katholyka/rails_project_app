class Booking < ActiveRecord::Base
    has_and_belongs_to_many :mechanics
    belongs_to :car
    belongs_to :customer
    
    #validates_existence_of :car
    #validates_existence_of :customer

    validates_numericality_of :payement_count , :integer_only => true

    #validates_presence_of :date_start, :date_end, :mechanic_id, :car_id, :customer_id
end
