class AppMailer < ActionMailer::Base
  default :from => "mail@mednadom.com"

  #Посылаем письмо менеджеру, когда заказчик отсылает заказ
  def new_order(order, cart)
    @order, @cart = order, cart 
    mail(:to => ["sunchess@inbox.ru", "coastsun.ru@gmail.com"], :subject => "New order :: MedNaDom.Ru")  
  end

end
