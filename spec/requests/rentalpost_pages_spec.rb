require 'spec_helper'

describe "Rentalpost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "rentalpost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a rentalpost" do
        expect { click_button "Post" }.not_to change(Rentalpost, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'rentalpost_rental_desc', with: "Lorem ipsum" }
      it "should create a rentalpost" do
        expect { click_button "Post" }.to change(Rentalpost, :count).by(1)
      end
    end
  end

  describe "rentalpost destruction" do
    before { FactoryGirl.create(:rentalpost, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a rentalpost" do
        expect { click_link "delete" }.to change(Rentalpost, :count).by(-1)
      end
    end
  end
end
