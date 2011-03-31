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
    bathroom.address.latitude = 42.72996.to_s
    bathroom.address.longitude = -73.676529.to_s
    bathroom.title = "RPI Union - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "What can I say, this is the nicest bathroom in the Union and one of the nicest on the East side of campus. The lighting is perfect for taking a dump or releasing some fluids. The expansive mirror lets me ensure I'm on top of my game all day long! The handicapped stall is massive, and there's some nice anti-Greek vandalism in there!"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 4, :smell => 4, :overall => 5)
    Rating.create(:bathroom_id => bathroom.id, :clean => 4, :smell => 5, :overall => 4)
    Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 3, :overall => 4)

    puts "\t- inserted sample bathroom #{bathroom.title}"
  end
end

