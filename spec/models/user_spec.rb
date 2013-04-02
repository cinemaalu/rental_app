# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  mi_name    :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  phone1     :integer
#  phone2     :integer
#  phone3     :integer
#  addr1      :string(255)
#  addr2      :string(255)
#  city       :string(255)
#  state      :string(255)
#  country    :string(255)
#  uri        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do

  before { @user = User.new(first_name: "Userf", mi_name: "mi", last_name: "Userl", email: "user@example.com", password: "123sun", password_confirmation: "123sun", phone1: "4250000000", phone2: "4250000000", phone3: "4250000000", addr1: "addr1", addr2: "addr2", city: "Bothell", state: "WA", country: "USA", uri: "http://powerful-basin-7526.herokuapp.com/") }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:mi_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:phone1) }
  it { should respond_to(:phone2) }
  it { should respond_to(:phone3) }
  it { should respond_to(:addr1) }
  it { should respond_to(:addr2) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:country) }
  it { should respond_to(:uri) }
  it { should be_valid }

  describe "when first name is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end

  describe "when first name is too long" do
    before { @user.first_name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is too long" do
    before { @user.last_name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      @user.email = mixed_case_email
      @user.save
      @user.reload.email.should == mixed_case_email.downcase
    end
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "when addr1 is not present" do
    before { @user.addr1 = " " }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { @user.email = "a" * 76 }
    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when city is not present" do
    before { @user.city = " " }
    it { should_not be_valid }
  end

  describe "when state is not present" do
    before { @user.state = " " }
    it { should_not be_valid }
  end

  describe "when contry is not present" do
    before { @user.country = " " }
    it { should_not be_valid }
  end
end
