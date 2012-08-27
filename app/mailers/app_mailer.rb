class AppMailer < ActionMailer::Base
  default :from => "support@jsovet.ru"


  def support(message)
    @message = message
    mail(:to => ["sunchess@inbox.ru"], :subject => "Вопрос к администрации :: JSovet.Ru", :from => @message.email)
  end

end
