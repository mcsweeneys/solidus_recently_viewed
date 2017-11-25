Spree::ProductsController.class_eval do
  after_action :recently_viewed, only: :show

  def recently_viewed
    id = @product.id
    rvp = (session['recently_viewed_products'] || '').split(', ').map!(&:to_i)
    rvp.delete(id)
    rvp.prepend(id)
    rvp_max_count = (Spree::RecentlyViewed::Config[:recently_viewed_products_max_count] || 5).to_i
    rvp = rvp.first(rvp_max_count)
    session['recently_viewed_products'] = rvp.join(', ')
  end
end
