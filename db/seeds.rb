require 'faker'

users = 50.times.map do
  User.create!( :username => Faker::Name.first_name,
                :password => 'password')
end



questions = Question.create! [{ :title => "Cheap place to travel to?", :description => "Going on a vacation in July. I don't want to spend a lot of money. Where should I go?", :user_id => rand(1..50)},
                             { :title => "Best place to go in Yucatan Peninsula?", :description => "I'm going to the Yucantan Peninsuala/Riviera Maya, what's the best place to go? I'm going with a group of my girlfriends.", user_id: rand(1..50)},
                             { :title => "Honeymoon ideas?", :description => "Trying to plan my honeymoon. Where should I go?", :user_id => rand(1..50)},
                             { :title => "Hiking near NYC", :description => "I love hiking, what's an easily accessible place to go hiking, leaving from NYC.", :user_id => rand(1..50)},
                             { :title => "What cities should I go to in France?", :description => "I'm a Francophile and I'm going to France for a month. What are the must see cities?", :user_id => rand(1..50)},
                             { :title => "Best park in NYC", :description => "What's your favorite park in NYC. I'm new here, and all I know is Central Park, but I want to discover other parks to go to.", :user_id => rand(1..50)},
                             { :title => "Roadtrip anyone?", :description => "I have a car and gas is cheap. Where should I go? I'm leaving from NYC. Also, does anyone want to come with me?", :user_id => rand(1..50)},
                             { :title => "Is Morocco safe?", :description => "I'm going to Morocco, is it safe for a woman traveling alone?", :user_id => rand(1..50)},
                             { :title => "Best food in Paris?", :description => "I'm going to Paris in the fall, what should I eat?", :user_id => rand(1..50)},
                             { :title => "Best backpack for EuroTrip?", :description => "I'm a girl looking for the best backpack for my 3 month long trip to Europe. I'll be staying in hostels mostly.", :user_id => rand(1..50)},
                             { :title => "Best beach to go to in the US?", :description => "Looking for summer vacation ideas. Anywhere in the US will be considered.", :user_id => rand(1..50)},
                             { :title => "What town on the Amalfi Coast is best for a family to visit?", :description => "I want to go with my family and children, what's a good family friendly town.", :user_id => rand(1..50)},
                             { :title => "How long should I spend in Australia?", :description => "Going for my gap year. Help!", :user_id => rand(1..50)},
                             { :title => "Best gelato in Florence?", :description => "I love gelato, what is the best place to go!?", :user_id => rand(1..50)}]
