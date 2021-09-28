require 'pry'
class CashRegister

  attr_accessor :discount, :total, :last_trans, :items

  def initialize (discount = 0)
    @total = 0 
    @discount = discount
    @items = []
  end

  def add_item(title, price, opt_quantity = 1)
    self.last_trans = price * opt_quantity
    self.total += self.last_trans
    opt_quantity.times do
      self.items << title
    end
  end

  def apply_discount
    if self.discount != 0
      new_total = (100.0 - self.discount.to_f) / 100
      self.total = (self.total * new_total).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    # binding.pry
    end
  end

  def void_last_transaction
    self.total -= self.last_trans
  end
end
