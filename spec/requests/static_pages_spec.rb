require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Rental App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:rentalpost, user: user, rentaltype: "Home", rental_desc:	"Beautiful Home",	price: "1850", status: "T",		addrl1:	"2422 194th st se", city:	"Bothell", state:	"WA" , country:	"USA",	contactpref: "T")
        FactoryGirl.create(:rentalpost, user: user, rentaltype: "Home", rental_desc:	"Beautiful Home",	price: "1850", status: "T",		addrl1:	"2422 194th st se", city:	"Bothell", state:	"WA" , country:	"USA",	contactpref: "T")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.rental_desc)
        end
      end
    end
  end


  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }


    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { 'About Us' }


    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }


    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "Rental App"
    page.should_not have_selector 'title', text: full_title('Rental App')
  end
end

