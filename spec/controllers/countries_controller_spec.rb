require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CountriesController do
    subject { page }
    
  # This should return the minimal set of attributes required to create a valid
  # Country. As you add validations to Country, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
      {name: "Moldova"}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CountriesController. Be sure to keep this updated too.
  def valid_session
    {}
  end
# begin
  describe "GET index" do
    it "assigns all countries as @countries" do
      country = Country.create! valid_attributes
      visit countries_path
      # page { should have_text 'Only admins can see this page' }
      # puts page.html
      page.html {should have_text 'Listing countries'}
    end
  end
# end
# begin 
    describe 'index as admin' do
        
        it 'displays if logged in as admin' do
            @user = User.new(name: "Example User", email: "lsllsl@example.com",
                                
            password: "hello", password_confirmation: "hello", classification: 'administrator' )
            # let(:user) { FactoryGirl.create(:adminuser) }
            visit(login_url @user)
            # page {should have_text 'Listing countries'}
            puts page.html
            page { should have_text 'Only admins can see this page' }
    
        end
    end
# end
=begin
  describe "GET show" do
    it "assigns the requested country as @country" do
      country = Country.create! valid_attributes
      get :show, {:id => country.to_param}, valid_session
      assigns(:country).should eq(country)
    end
  end
=end

=begin
  describe "GET new" do
    it "assigns a new country as @country" do
      get :new, {}, valid_session
      assigns(:country).should be_a_new(Country)
    end
  end

  describe "GET edit" do
    it "assigns the requested country as @country" do
      country = Country.create! valid_attributes
      get :edit, {:id => country.to_param}, valid_session
      assigns(:country).should eq(country)
    end
  end
=end

=begin
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Country" do
        expect {
          post :create, {:country => valid_attributes}, valid_session
        }.to change(Country, :count).by(1)
      end

      it "assigns a newly created country as @country" do
        post :create, {:country => valid_attributes}, valid_session
        assigns(:country).should be_a(Country)
        assigns(:country).should be_persisted
      end

      it "redirects to the created country" do
        post :create, {:country => valid_attributes}, valid_session
        response.should redirect_to(Country.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved country as @country" do
        # Trigger the behavior that occurs when invalid params are submitted
        Country.any_instance.stub(:save).and_return(false)
        post :create, {:country => {}}, valid_session
        assigns(:country).should be_a_new(Country)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Country.any_instance.stub(:save).and_return(false)
        post :create, {:country => {}}, valid_session
        response.should render_template("new")
      end
    end
  end
=end

=begin
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested country" do
        country = Country.create! valid_attributes
        # Assuming there are no other countries in the database, this
        # specifies that the Country created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Country.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => country.to_param, :country => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested country as @country" do
        country = Country.create! valid_attributes
        put :update, {:id => country.to_param, :country => valid_attributes}, valid_session
        assigns(:country).should eq(country)
      end

      it "redirects to the country" do
        country = Country.create! valid_attributes
        put :update, {:id => country.to_param, :country => valid_attributes}, valid_session
        response.should redirect_to(country)
      end
    end

    describe "with invalid params" do
      it "assigns the country as @country" do
        country = Country.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Country.any_instance.stub(:save).and_return(false)
        put :update, {:id => country.to_param, :country => {}}, valid_session
        assigns(:country).should eq(country)
      end

      it "re-renders the 'edit' template" do
        country = Country.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Country.any_instance.stub(:save).and_return(false)
        put :update, {:id => country.to_param, :country => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end
=end

=begin
  describe "DELETE destroy" do
    it "destroys the requested country" do
      country = Country.create! valid_attributes
      expect {
        delete :destroy, {:id => country.to_param}, valid_session
      }.to change(Country, :count).by(-1)
    end

    it "redirects to the countries list" do
      country = Country.create! valid_attributes
      delete :destroy, {:id => country.to_param}, valid_session
      response.should redirect_to(countries_url)
    end
  end
=end
end
