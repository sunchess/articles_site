class AppMailer < ActionMailer::Base
  default :from => "mail@mednadom.com"
  helper :shoping_carts


  #Посылаем письмо менеджеру, когда заказчик отсылает заказ
  def new_order(order, cart)
    @order, @cart = order, cart
    mail(:to => ["zakaz@mednadom.com", "coastsun.ru@gmail.com"], :subject => "New order :: MedNaDom.Ru")
  end

  def _question(quesiton)
    @question  = quesiton
    mail(:to => ["zakaz@mednadom.com", "coastsun.ru@gmail.com"], :subject => "New question :: MedNaDom.Ru")
  end

  def _review(review)
    @review  = review
    mail(:to => ["zakaz@mednadom.com", "coastsun.ru@gmail.com"], :subject => "New review :: MedNaDom.Ru")
  end

end
