FactoryGirl.define do

  factory :document do
    title 'A Modest Proposal'
    slug 'a_modest_proposal'
    source 'quip'
    sequence(:source_id) { |n| "source_#{n}" }
    author 'Jonathan Swift'
    body_html 'I am assured by a very knowing American of my acquaintance in London; that a young healthy child, well nursed, is, at a year old, a most delicious, nourishing, and wholesome food; whether stewed, roasted, baked or boiled, and I make no doubt, that it will equally serve in a fricassee, or ragout.'
  end

end