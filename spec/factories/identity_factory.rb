FactoryGirl.define do

  factory :identity do
    sequence(:uid) { |n| n }
    provider 'generic_provider'
    sequence(:token) { |n| n }
    sequence(:refresh_token) { |n| n }
    name "Bob Doberts"
    sequence(:email) { |n| "bob_#{n}@example.com" }

    factory :facebook_identity do
      provider 'facebook'
    end

  end

end
