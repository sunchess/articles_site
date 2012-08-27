class ContactsController < ApplicationController
  add_breadcrumb Proc.new{|c| c.t("contacts.new.title")}, :new_contact_path

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      AppMailer.support(@message).deliver
      flash[:notice] = t("contacts.successfully_create")
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

end
