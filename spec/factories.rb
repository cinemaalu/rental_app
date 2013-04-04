
FactoryGirl.define do
  factory :user do
	  sequence(:first_name) { |n| "Person #{n}" }
		mi_name 							""
	  sequence(:last_name)  { |n| "Person #{n}" }
	  sequence(:email) 			{ |n| "person_#{n}@example.com"}   
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

    factory :admin do
      admin true
    end
  end
end



