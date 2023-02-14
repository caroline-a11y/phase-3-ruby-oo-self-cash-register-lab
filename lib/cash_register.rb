class CashRegister
    attr_accessor :total, :discount, :items
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end
    class RegisterItem

    attr_accessor :title
    attr_accessor :price
    attr_accessor :quantity

    def initialize(title, price)
    def initialize(title, price, quantity)
      self.title = title
      self.price = price
      self.quantity = quantity
    end 

    def toString
      "#{self.title} (#{self.price})"
      "#{self.title} (#{self.price}) [#{self.quantity}]"
    end
  end

  attr_accessor :total

  def add_item(title, price, quantity=1)
    self.total = @total + (price * quantity)
    quantity.times { @register_items.push(RegisterItem.new(title, price)) }
    self.total = self.total + (price * quantity)
    @register_items.push(RegisterItem.new(title, price, quantity))
  end

  def apply_discount
    if @discount == nil
    if self.discount == nil
      return "There is no discount to apply."
    else
      self.total = (@total * (100-@discount) / 100)
      self.total = (self.total * (100-self.discount) / 100)
    end
    "After the discount, the total comes to $#{@total}."
    "After the discount, the total comes to $#{self.total}."
  end

  def items
    @register_items.map { |item| item.title }
    @register_items.map { |item| (1..item.quantity).entries.map { item.title } }.flatten
  end

  def void_last_transaction
    self.total = (@total - @register_items.pop.price)
    last_transaction = @register_items.pop
    
    self.total = (self.total - (last_transaction.price * last_transaction.quantity)).round 2
  end
end
