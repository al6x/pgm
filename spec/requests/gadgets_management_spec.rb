require "spec_helper"

describe 'Gadgets Management' do
  describe 'Anonymous User' do
    it "should redirect to sign in form" do
      get '/'
      response.should redirect_to('/sessions/new')
    end
  end

  describe 'Registered User' do
    # NOTE: we can also move this method helpers.
    def login_as_registered
      user = User.new name: 'Jim'
      ApplicationController.any_instance.stub(:current_user).and_return(user)
    end

    before :each do
      login_as_registered
    end

    it "should display welcome page" do
      get '/'
      response.body.should include('Welcome')
    end

    # NOTE: Etc., it's little time left, so submitting it as it is.
  end
end