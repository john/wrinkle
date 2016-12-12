require 'rails_helper'
RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe Document, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(200)}

  # PROVIDERS.each do |provider|
  #   it "implements create_or_update_from_* for #{provider}" do
  #     expect{Document.public_send("create_or_update_from_#{provider}")}.to_not raise_error(Errors::UnimplementedError)
  #   end
  #
  #   it "creates a hash for doc creation" do
  #     expect{Document.send("#{provider}_doc_hash")}.to_not raise_error(Errors::UnimplementedError)
  #   end
  # end

end
