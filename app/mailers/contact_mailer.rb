class ContactMailer < ApplicationMailer
  default from: 'appdipre@gmail.com'

  def contact_email(contact)
    @contact = contact
    puts 1
    mail(to:'lfbesa@uc.cl', subject: @contact.subject, from: "appdipre@gmail.com")
    puts 2
  end
end
