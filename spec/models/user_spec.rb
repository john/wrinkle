require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:identities) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:name).is_at_most(50)}
  it { should validate_length_of(:email).is_at_most(50)}

  describe "no identities user" do
    before(:each) do
      @user = create :user
    end

    it "facebook_authed? should be false" do
      expect( @user.facebook_authed? ).to be false
    end
  end

  describe "facebook user" do
    before(:each) do
      @user = create :facebook_user

      # next three lines should be happening in the factory, not sure why they're not
      @fb_identity = create :facebook_identity
      @fb_identity.user = @user
      @fb_identity.save
    end

    it "facebook_authed? true for facebook user" do
      expect( @user.facebook_authed? ).to be true
    end

    it "should spec facebook_identity" do
      expect( @user.identities[0] ).to eq(@fb_identity)
    end
  end
end
