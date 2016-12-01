# Abstract stubs for all providers, to be overridden
# in document.rb. If not overriden will raise error; reminder to implement!

module Providers
  extend ActiveSupport::Concern

  # Create stub methods
  PROVIDERS.each do |provider|
    self.class.class_eval do
      define_method "create_or_update_from_#{provider}" do |*arguments|
        raise Errors::UnimplementedError.new("You need to implement a create_or_update_from_#{provider} method in document.rb")
      end

      define_method "#{provider}_doc_hash" do |*arguments|
        raise Errors::UnimplementedError.new("You need to implement a #{provider}_doc_hash method in document.rb")
      end
    end
  end

end
