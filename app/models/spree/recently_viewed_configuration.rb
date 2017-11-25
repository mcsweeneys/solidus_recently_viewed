module Spree
  class RecentlyViewedConfiguration < Spree::Preferences::Configuration
    preference :recently_viewed_products_max_count, :integer, default: 5
  end
end
