FactoryGirl.define do

	sequence :slug do |n| 
	  "slug#{n}"
	end
	
	factory :pin do
	  title "Rails Cheatsheet"
	  url "http://rails-cheat.com"
	  text "A great tool for beginning developers"
	  slug
	  category category_id("2")
	end
	
  factory :user do 
    sequence(:email) { |n| "coder#{n}@skillcrush.com" }
    first_name "Skillcrush"
    last_name "Coder"
    password "secret"
	
		after(:create) do |user|
			create_list(:pin, 3)
	  end
	end 
end