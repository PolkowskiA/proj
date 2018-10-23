FactoryBot.define do

	factory :comment do
		content					{ FFaker::Lorem.sentence }
		rating					{rand(1..5)}
		project
		user
	end

end