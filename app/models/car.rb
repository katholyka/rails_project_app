class Car < ActiveRecord::Base
    belongs_to :model
    belongs_to :customer
    has_many :bookings
    
    #validates_existence_of :model
    #validates_existence_of :customer

    validates_numericality_of :engine_size , :integer_only => true, :message => "The engine size must be integer"

    validates_presence_of :engine_size, :model_id, :customer_id
end
