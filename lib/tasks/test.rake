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
    bathroom.address.zip = "12180"
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

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "GNC area"
    bathroom.address.street_address = "272 Hoosick Street"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.738723.to_s
    bathroom.address.longitude = -73.669896.to_s
    bathroom.title = "Rite	Aid Hoosick - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This bathroom is located at GNC area in Rite Aid. It is a room type bathroom so you can have some privacy when you are doing No.2. Smell was okay and fairly clean."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 3, :overall => 3)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "One near Customer Service and other near Kitchen Section"
    bathroom.address.street_address = "760 Hoosick Road"
    bathroom.address.city = "Brunswick"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.74572.to_s
    bathroom.address.longitude = -73.638868.to_s
    bathroom.title = "Brunswick Walmart - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "There are two bathrooms in this place. One is located near customer service and the other near Kitchen & Dining Section which is pretty far from the entrance so do not use this one if you are about to relieve yourself. However the far one is bigger and less chance to be occupied. So the choice is yours. It is definately clean but the air freshener smell was kinda weird to me."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 4, :smell => 3, :overall => 4)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Near Self Checkout"
    bathroom.address.street_address = "716 Hoosick Road"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.742427.to_s
    bathroom.address.longitude = -73.643289.to_s
    bathroom.title = "Brunswick Price Chopper - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This bathroom is moderately clean and also smells not bad. But it is hard to find because it is located in corner. It is next to the self Checkout section."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 4, :overall => 4)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Near Pharmacy"
    bathroom.address.street_address = "549 Hoosick Street"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.73955.to_s
    bathroom.address.longitude = -73.658851.to_s
    bathroom.title = "Walgreens Hoosick - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This bathroom looks dirty from the entrance. It doesn't use any air freshener but does not stink. Basin is rusted and looks not good. But overall it is not a nasty bathroom."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 2, :smell => 3, :overall => 3)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Near Cinema"
    bathroom.address.street_address = "1 Crossgates Mall Road"
    bathroom.address.city = "Albany"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12203"
    bathroom.address.latitude = 42.690732.to_s
    bathroom.address.longitude = -73.853252.to_s
    bathroom.title = "Crossgates Mall Cinema 1F - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This is one stinky bathroom maybe because many people are using it. Crossgates Mall is the largest mall in Albany and I can't believe they are not using fresheners. Floor is also nasty because of the dripped urine. It gets more stinky and dirty in the evening."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 2, :smell => 2, :overall => 2)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Cafeteria 2F"
    bathroom.address.street_address = "1 Crossgates Mall Road"
    bathroom.address.city = "Albany"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12203"
    bathroom.address.latitude = 42.689423.to_s
    bathroom.address.longitude = -73.850806.to_s
    bathroom.title = "Crossgates Mall Cafeteria 2F - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This bathroom is located next to FYE store in cafeteria area. It smells pissy and the basin is also very dirty. And I don't understand why they put the urinals right next to the bathroom entrance."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 2, :overall => 3)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Opposite side of Cafe"
    bathroom.address.street_address = "131 Colonie Center Suite 355"
    bathroom.address.city = "Albany"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12205"
    bathroom.address.latitude = 42.710854.to_s
    bathroom.address.longitude = -73.815765.to_s
    bathroom.title = "Barns & Noble Colonie Centre - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This bathroom is located opposite side of Barns & Noble cafe. Before I came in, I had an expectation of a perfect smell and cleanness since it is a bookstore bathroom. It was very clean but sorry to have a little bit of urinous smell. This place will be much better if they put some freshener."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 4, :smell => 3, :overall => 4)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Next to the pickup area"
    bathroom.address.street_address = "549 Troy Schenectady Road"
    bathroom.address.city = "Latham"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12110"
    bathroom.address.latitude = 42.751298.to_s
    bathroom.address.longitude = -73.764267.to_s
    bathroom.title = "Starbucks Latham - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This is the \"green\" room type bathroom. It has only dryer and absolutely good smell thanks to the coffee aroma wafted from kitchen. I thought I could stay for an hour if I have some book. The basin was really convenient to use because the water and soap faucets sit side by side."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 5, :smell => 5, :overall => 5)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "At the end"
    bathroom.address.street_address = "601 Troy Schenectady Road"
    bathroom.address.city = "Latham"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12110"
    bathroom.address.latitude = 42.754544.to_s
    bathroom.address.longitude = -73.766327.to_s
    bathroom.title = "Panera Bread Latham Farm - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "If you enter the store and keep going straight, the bathroom is in right hand side at the end. It is not that dirty but the floor is very sticky and it still stinks even though they put some fresheners."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 2, :smell => 2, :overall => 2)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "VCC"
    bathroom.address.street_address = "110 8th Street"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.72914.to_s
    bathroom.address.longitude = -73.682063.to_s
    bathroom.title = "RPI VCC - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This bathroom has a smell of stale urine. Basin is weirdly shaped and inconvenient to use. Gotta be cleaner than this."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 2, :overall => 2)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Library 4F"
    bathroom.address.street_address = "110 8th Street"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.729535.to_s
    bathroom.address.longitude = -73.682621.to_s
    bathroom.title = "RPI Library 4F - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This bathroom is moderately clean and does not have urine smell but it usually become very dirty during weekend. The wastebasket is full of paper towels and also it is all over the floor. This happens because many students use library during weekend with no janitors"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 3, :overall => 3)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Sage 2000 Level"
    bathroom.address.street_address = "110 8th Street"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.730874.to_s
    bathroom.address.longitude = -73.681569.to_s
    bathroom.title = "RPI Sage 2000 Level - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "It seems this bathroom is one of the old style bathrooms in RPI. But it was clean and didn't stink."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 3, :overall => 3)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "87 Gym 2F"
    bathroom.address.street_address = "110 8th Street"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.730638.to_s
    bathroom.address.longitude = -73.678844.to_s
    bathroom.title = "RPI 87 Gym - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "I guess this is the worst bathroom in RPI campus. The stench of urine hit me when I walked in and wanted to get out right away. This bathroom is very old and hard to find. You have to walk and pass the locker and shower room to get here. The funny thing is its urinals. They are ridiculously close each other."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 2, :smell => 1, :overall => 2)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "DCC"
    bathroom.address.street_address = "110 8th Street"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.729566.to_s
    bathroom.address.longitude = -73.679144.to_s
    bathroom.title = "RPI DCC - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This bathroom is located next to the Jazzman's cafe. It is fairly clean and smell is tolerable."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 2, :overall => 3)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Mueller Center"
    bathroom.address.street_address = "1680 15th Street"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.728849.to_s
    bathroom.address.longitude = -73.67716.to_s
    bathroom.title = "RPI Mueller Center - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This is a room type bathroom and good place to have a privacy. The red tile on the wall looks good and does not stink that much."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 3, :overall => 3)

    bathroom = Bathroom.new
    bathroom.gender = "Male"
    bathroom.hidden = false
    bathroom.user_id = user.id

    bathroom.build_address
    bathroom.address.inside_location = "Armory"
    bathroom.address.street_address = "1650 15th Street"
    bathroom.address.city = "Troy"
    bathroom.address.state = "NY"
    bathroom.address.country = "United States"
    bathroom.address.zip = "12180"
    bathroom.address.latitude = 42.728431.to_s
    bathroom.address.longitude = -73.67716.to_s
    bathroom.title = "RPI Armory - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""

    bathroom.save!

    #BathroomSpec.create(:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!


    commentbody1 = "This bathroom is in very old building and looks pretty old, too. It is clean and has neither pleasant nor unpleasant smell."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody1)
    commentbody2 = "comment body 2"
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :body => commentbody2)

    Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 3, :overall => 3)

    puts "\t- inserted sample bathroom #{bathroom.title}"
	
	bathroom = Bathroom.new
	bathroom.gender = "Female"
	bathroom.hidden = false
	bathroom.user_id = user.id
	
	bathroom.build_address
	bathroom.address.inside_location = "2nd Floor"
	bathroom.address.street_address = "1718 15th Street"
	bathroom.address.city = "Troy"
	bathroom.address.state = "NY"
	bathroom.address.country = "USA"
	bathroom.address.zip = "12180"
	bathroom.address.latitude = 42.72996.to_s
	bathroom.address.longitude = -73.676529.to_s
	bathroom.title = "RPI Union - \"#{bathroom.address.inside_location} - #{bathroom.gender.to_s}\""
	
	bathroom.save!

    #BathroomSpec.create(:key => "Number of Stalls", :value => "4", :bathroom_id => bathroom.id)
    #BathroomSpec.create(:key => "Number of Sinks", :value => "3", :bathroom_id => bathroom.id)

    specs_params = [{:key => "spec 1", :value => "value 1", :bathroom_id => bathroom.id},
                    {:key => "spec 2", :value => "value 2", :bathroom_id => bathroom.id}
                    ]

    bathroom.bathroom_specs.build(specs_params)
    bathroom.save!

    r = Rating.create(:bathroom_id => bathroom.id, :clean => 3, :smell => 3, :overall => 3)	

    commentbody1 = "It seems to have functional female product distributors."
    Comment.create(:user_id => user.id, :bathroom_id => bathroom.id, :rating_id => r.id, :body => commentbody1)

  end

end






