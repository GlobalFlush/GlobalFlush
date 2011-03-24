namespace :test do

  task :insert_data => :environment do
    puts "## Inserting sample data to the database"


    user = User.find_or_create_by_login("testing")
    user.login = "testing"
    user.email = "testing@hotmail.com"
    user.password = "123456"
    user.password_confirmation = "123456"
    user.save!
    
    puts "\t- inserted user #{user.login}"

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Upper level"
    bathroom.address.street_address = "1718 15th Street"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.longitude = 42.72996.to_s
    bathroom.address.latitude = -73.676529.to_s
    bathroom.title = "RPI Union - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    puts "\t- inserted sample bathroom #{bathroom.title}"
  end
end

