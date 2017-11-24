RSpec.describe Spree::Product, type: :model do
  before do
    3.times { create(:product) }
  end

  describe '.find_by_array_of_ids' do
    it 'returns the products specified in the array of product ids' do
      product_ids = Spree::Product.limit(2).map(&:id)
      products = Spree::Product.where(id: product_ids)
      expect(products.size).to be(2)
    end

    it 'ignores nonexistant product ids and still return correctly specified products' do
      product_ids = Spree::Product.limit(2).map(&:id) << 200
      products = Spree::Product.where(id: product_ids)
      expect(products.size).to be(2)
    end

    it 'returns an empty array when no valid ids are specified' do
      products = Spree::Product.where(id: [200])
      expect(products).to eq([])
    end
  end
end
