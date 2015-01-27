require('spec_helper')

describe(Purchase) do
  describe("#total") do
    it("takes a list of products and sums the price of each") do
      @purchase1 = Purchase.create({:total => 0})
      @product1 = Product.create({:product_name => "apple", :price => 4.00, :purchase_id => @purchase1.id})
      @product2 = Product.create({:product_name => "orange", :price => 6.00, :purchase_id => @purchase1.id})
      @purchase1.products << @product1
      @purchase1.products << @product2
      expect(@purchase1.total).to eq 10.00
    end
  end
end
