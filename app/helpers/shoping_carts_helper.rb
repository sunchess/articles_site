module ShopingCartsHelper
  def value_h(v)
    case v.to_i
    when 1000
      "1 килограмм"
    when 1400
      "1 литр(1400 грамм)"
    when 4200
      "3 литра(4200 грамм)"
    end
  end
end
