class Discount < ActiveRecord::Base
  belongs_to :product
  enum discount_operation: { fixed: 0, percent: 1 }

  def self.get_order_total(products = [])
    products
  end

  def apply(order, cart_data)
    discounts_count = (cart_data[:qty] / self.product_qty)
    discounts_count.times do
      self.apply_discount(order)
    end
  end

  protected

  def apply_discount(order)
    total = order.get_total
    total -= self.discount_amount if self.fixed?
    total -= ((total * self.discount_amount)/100) if self.percent?
    order.set_total(total)
    total
  end

end
