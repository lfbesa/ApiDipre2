class ContactMailer < ApplicationMailer
  default from: 'appdipre@gmail.com'

  def contact_email(contact)
    @contact = contact
    mail(to:'dipre@ing.puc.cl', subject: @contact.subject, from: "appdipre@gmail.com")
  end
end
