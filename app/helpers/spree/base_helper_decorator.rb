Spree::BaseHelper.module_eval do
  def recently_viewed_products_ids
    (session['recently_viewed_products'] || '').split(', ').map!(&:to_i)
  end

  def recently_viewed_products
    Spree::Product.where(id: recently_viewed_products_ids)
  end
end
