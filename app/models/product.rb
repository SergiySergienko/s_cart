class Product < ActiveRecord::Base
  has_many :discounts

  attr_accessor :qty, :batch_price

  def get_qty
    @qty || 0
  end

  def set_qty(qty)
    @qty = qty
  end

  def has_discounts?
    return (!discounts.empty?)
  end

end
