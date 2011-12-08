class CartItems
  attr_accessor :products, :total

  def initialize()
    @products = Array.new 
    @total = 0
  end
  
  def add(pos, amount)
    @products.push [pos.id, pos.price, pos.name, amount]
    price = ( amount/1000.0 ) * pos.price.to_f
    @total = @total + price
  end

  def delete(pos, amount, index)
    @products.delete_at(index.to_i)
    price = ( amount/1000.0 ) * pos.price.to_f
    @total = @total - price
  end

  def clear
    @products = []
    @total = 0
  end

  def size
    @products.size
  end

end
