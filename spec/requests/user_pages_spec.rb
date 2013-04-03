require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.first_name+' '+user.last_name) }
    it { should have_selector('title', text: user.first_name+' '+user.last_name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do

      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error') }
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: user.first_name+' '+user.last_name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "First_Name",   with: "Example User"
        fill_in "Middle_Name",	with: "Example User"
        fill_in "Last_Name",   	with: "Example User"
        fill_in "Email",        with: "cinemaalu@live.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
        fill_in "Home", 				with: "4250000000"
        fill_in "Moblie",				with: "4250000000"
        fill_in "Office",				with: "4250000000"
        fill_in "Street",				with: "yyyyyy"
        fill_in "city", 				with: "yyyyyy"
        fill_in "State", 				with: "yyyyyy"
        fill_in "Country",			with: "yyyyyy"
        fill_in "URI",					with: "http://powerful-basin-7526.herokuapp.com/"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end

