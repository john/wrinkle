# from: http://tech-brains.blogspot.in/2012/11/kaminari-willpaginate-incompatibility.html
# so that will_paginate doesn't conflict with kaminari, which is used in rails_admin

if defined?(WillPaginate)
  module WillPaginate
    module ActiveRecord
      module RelationMethods
        def per(value = nil) per_page(value) end
        def total_count() count end
      end
    end
    module CollectionMethods
      alias_method :num_pages, :total_pages
    end
  end
end
