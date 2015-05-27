class DiscountsManager

  class Order

    attr_accessor :products

    def initialize(cart_data)
      @products = []
      @cart_data = cart_data
      @total = 0
      @total_without_discount = 0
      format_order
    end

    def get_total
      @total
    end

    def get_total_without_discount
      @total_without_discount
    end

    def set_total(total)
      @total = total
    end

    def format_order
      poppulate_products
      calc_each_batch_price
      calc_total
      apply_discounts
    end

    def poppulate_products
      pids = @cart_data.keys
      @products = Product.includes(:discounts).where(id: pids)
      @products.map {|p| p.qty = @cart_data[p.id.to_s][:qty]}
    end

    def apply_discounts
      @products.each do |product|
        if product.has_discounts?
          product.discounts.each do |discount|
            discount.apply(self, @cart_data[product.id.to_s])
          end
        end
      end
    end

    def calc_each_batch_price
      @products.map {|p| p.batch_price = (p.price * p.qty)}
    end

    def calc_total
      @products.each do |product|
        @total += product.batch_price
      end
      @total_without_discount = @total
    end

  end

  def self.get_order(cart_data)
    Order.new(cart_data)
  end

end