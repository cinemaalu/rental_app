
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(	first_name: 		"Userf", 
									mi_name: 				"mi", 
									last_name: 			"Userl", 
									email: 					"user@example.com", 
									password: 			"123sun", 
									password_confirmation: "123sun", 
									phone1: 				"4250000000", 
									phone2: 				"4250000000", 
									phone3: 				"4250000000", 
									addr1: 					"addr1", 
									addr2: 					"addr2", 
									city: 					"Bothell", 
									state: 					"WA", 
									country: 				"USA", 
									uri: 						"http://rental.heroku.com/")
    15.times do |n|
      first_name  = Faker::Name.name
      last_name  	= Faker::Name.name
      email 			= "example-#{n+1}@railstutorial.org"
      password  	= "password"
      User.create!(first_name: 	first_name,
									 last_name: 	last_name,	
                   email: 			email,
                   password: 		password,
                   password_confirmation: password,
									 phone1: 				"4250000000", 
									 phone2: 				"4250000000", 
									 phone3: 				"4250000000", 
									 addr1: 				"addr1", 
								   addr2: 				"addr2", 
									 city: 					"Bothell", 
									 state: 				"WA", 
									 country: 			"USA")
		end
    users = User.all(limit: 6)
    15.times do
      rental_desc = Faker::Lorem.sentence(5)
      users.each { |user| user.rentalposts.create!(rentaltype: "Home", rental_desc:rental_desc, price:"1850", status:"T", addrl1:"2422 194th st se", city:"Bothell", state:"WA", country:"USA", contactpref:"T") }
    end
  end
end

