class CartItems
  attr_accessor :products, :total

  def initialize()
    @products = Array.new 
    @total = 0
  end
  
  def add(pos)
    @products.push [pos.id, pos.price, pos.name]
    @total = @total + pos.price
  end

  def delete(pos)
    @products.delete([pos.id, pos.price, pos.name])
    @total = @total - pos.price
  end

  def clear
    @products = []
    @total = 0
  end

  def size
    @products.size
  end

end
