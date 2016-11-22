require 'spec_helper'
require 'shoulda/matchers'

RSpec.describe User, type: :model do
    @user = User.create(email: "coder@skillcrush", password: "password")

 
	after(:all) do
	  if !@user.destroyed?
	    @user.destroy
	  end
	end
	 
	it 'authenticates and returns a user when valid email and password passed in' do
	 
	end

	it { should validate_presence_of(:first_name) }
	it { should validate_presence_of(:last_name) }
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password) }
end
