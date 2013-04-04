
FactoryGirl.define do
  factory :user do
		first_name 						"Sunny" 
		mi_name 							""
		last_name 						"Sun"
		email 								"rentalhome@live.com"
		password 							"123sun" 
		password_confirmation	"123sun"
		phone1 								"4250000000" 
		phone2 								"4250000000"
		phone3 								"4250000000"
		addr1 								"addr1"
		addr2 								"addr2"
		city 									"Bothell"
		state 								"WA" 
		country 							"USA"
		uri 									"http://rental.herokuapp.com/"
  end
end



