class ContactsController < ApplicationController
  before_action :current_user

  def new
    @contact = Contact.new
      respond_to do |format|
        format.html
        format.js
      end  
  end

  def create
    puts "IN CONTACT#CREATE"


  puts ENV["MANDRILL_USERNAME"]
  puts  ENV["MANDRILL_API_KEY"]


    @contact = Contact.new(contacts_params)
    @contact.request = request

    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
    end
      redirect_to controller: 'home', action: 'show'
  end

private
def contacts_params
  params.require(:contact).permit(:name, :email, :reason, :message)
end
end
