class CartItems
  attr_accessor :products, :total

  def initialize()
    @products = Array.new
    @total = 0
  end

  def add(pos, amount)
    pos_price = if amount == 1400
      pos.price_one_liter
    elsif amount == 4500
      pos.price_three_liters
    else
      pos.price
    end

    val = [pos.id, pos_price, pos.name, amount]
    prod = @products.select{|p| p.first == pos.id}
    unless prod.empty?
      prod = prod.first

      indx = @products.index(prod)
      prod[3] = prod[3] + amount

      # replice position of array
      @products[indx] = prod

      price = pos_price.to_f
    else
      @products.push val
      price = pos_price.to_f
    end
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
