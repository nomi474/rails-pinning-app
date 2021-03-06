require 'spec_helper'
RSpec.describe PinsController do
	describe "GET index" do	 
		  it 'renders the index template' do
			get :index
			expect(response).to render_template("index")
		  end		
	end
	
	describe "GET edit" do
		# get to /pins/id/edit
		# responds successfully
		pin = Pin.find_by_slug("rails-tutorial")
		it 'responds with successfully' do
		  #pin = Pin.find_by_slug("rails-tutorial")
		  get :edit, :id => pin.id 
		  expect(response.success?).to be(true)
		end
		# renders the edit template
		it 'renders the edit view' do
		  #pin = Pin.find_by_slug("rails-tutorial")
		  get :edit, :id => pin.id      
		  expect(response).to render_template(:edit)
		end
		
		# assign an intance variable called @pin to the Pin with the appropriate id
		#  get :new
		# expect(assigns(:pin)).to be_a_new(Pin)
		#end
	  end
	  
	  describe "PUT update" do
		before(:each) do
		  @pin_hash = { 
			title: "Rails Wizard", 
			url: "http://railswizard.org", 
			slug: "rails-wizard", 
			text: "A fun and helpful Rails Resource",
			resource_type: "rails"}    
		end
		
		after(:each) do
		  pin = Pin.find_by_slug("rails-wizard")
		  if !pin.nil?
			pin.destroy
		  end
		end
		
		#it 'responds with a redirect' do
		 # post :create, pin: @pin_hash
		  #expect(response.redirect?).to be(true)
		#end
		
		it 'updates a pin' do
		  patch :update, pin: @pin_hash  
		  expect(Pin.find_by_slug("rails-wizard").present?).to be(true)
		end
		
		it 'redirects to the pin view' do
		  patch :update, pin: @pin_hash  
		  expect(response).to redirect_to(pin_url(assigns(:pin)))
		end
		
		it 'redisplays new form on error' do
		  # The title is required in the Pin model, so we'll
		  # delete the title from the @pin_hash in order
		  # to test what happens with invalid parameters
		  @pin_hash.delete(:title)
		  patch :update, pin: @pin_hash
		  expect(response).to render_template(:edit)
		end
		
		it 'assigns the @errors instance variable on error' do
		  # The title is required in the Pin model, so we'll
		  # delete the title from the @pin_hash in order
		  # to test what happens with invalid parameters
		  @pin_hash.delete(:title)
		  patch :update, pin: @pin_hash
		  expect(assigns[:errors].present?).to be(true)
		end    		
	  end
end	  
	  