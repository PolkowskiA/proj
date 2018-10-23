FactoryBot.define do
	factory :project do

		name  { FFaker::Lorem.sentence }
		description { FFaker::Lorem.paragraph }
		user
	end
end