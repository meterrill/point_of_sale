class Purchase < ActiveRecord::Base
  has_many :products

  define_method(:total) do
    @total=0
    self.products.each do |product|
      @total += product.price
    end
    @total
  end
end
