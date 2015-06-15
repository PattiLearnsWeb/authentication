require 'rails_helper'

describe User do 
	before do
		@user = create(:user)
	end

	it 'has a valid factory' do
		expect(@user).to be_valid
	end

	it 'is invalid without a name' do
		@user.name = nil
		expect(@user).to_not be_valid
	end

	it 'is invalid with a too long name' do
		@user.name = 'a' * 51
		expect(@user).to_not be_valid
	end

	it 'is invalid without an email' do
		@user.email = nil
		expect(@user).to_not be_valid
	end

	it 'is invalid with a too long email' do
		@user.email = 'b' * 256
		expect(@user).to_not be_valid
	end
end
