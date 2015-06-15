FactoryGirl.define do
	factory :user do
		name 'Patrick'
		email 'test@test.com'
		password 'password'
		password_confirmation 'password'
	end
end