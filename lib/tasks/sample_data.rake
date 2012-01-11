namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Customer.create!(:first_name => "Vasja",
                 :last_name => "Pupkin",
                 :gender => "m",
                 :email => "pupkin@mail.ru",
                 :phone_number => "(38)0990124146",
                 :address => "Chapaew str. 55a/15",
                 :details => "nothing special")

    55.times do |n|
      first_name  = Faker::Name.first_name
      last_name = Faker::Name.last_name
      gender = "fm"
      email = Faker::Internet.email
      phone_number = Faker::PhoneNumber.phone_number
      address = Faker::Address.street_address
      details = Faker::Lorem.sentence(5)
      Customer.create!(:first_name => first_name,
                   :last_name => last_name,
                   :gender => gender,
                   :email => email,
                   :phone_number => phone_number,
                   :address => address,
                   :details => details)
    end

    55.times do |n|
      manufacturer_name  = Faker::Name.last_name
      details = Faker::Lorem.sentence(5)
      Manufacturer.create!(:manufacturer_name => manufacturer_name,
                           :details => details)
    end
    
    Manufacturer.all(:limit =>15).each do |manufacturer|
        5.times do
            model_name= Faker::Name.last_name
            date_create=Time.new
            details = Faker::Lorem.sentence(5)
            manufacturer.models.create!(:model_name =>model_name,
                                        :date_create =>date_create,
                                        :details =>details)
        end
    end

    
    
Customer.all(:limit =>5).each do |customer|
        1.times do
            engine_size=rand(555)
            details=Faker::Lorem.sentence(5)
            Model.all(:limit =>5).each do |model|
                customer.cars.create!(:engine_size => engine_size,
                                      :details => details,
                                      :model_id => model.id)   
            end  
        end
end
Customer.all(:limit =>15).each do |customer|
        5.times  do
            date_start = Time.now
            date_end = Time.now
            payement_count = rand(1555)
            customer.bookings.create!(:payement_count => payement_count,
                                      :date_start => date_start,
                                      :date_end => date_end)
        end
    end

    Booking.all(:limit=>15).each do |booking|
      
      5.times do
          mechanic_name  = Faker::Name.last_name
          phone_number = Faker::PhoneNumber.phone_number
          details = Faker::Lorem.sentence(5)
          booking.mechanics.create!(:mechanic_name => mechanic_name,
                           :phone_number => phone_number, 
                           :details => details,
                           :booking_id => booking.id)
      end
    end

  end
end

