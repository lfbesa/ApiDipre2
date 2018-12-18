class ContactMailer < ApplicationMailer
  default from: 'appdipre@gmail.cl'

  def contact_email(contact)
    @contact = contact
    puts 1
    mail(to:'lfbesa@uc.cl', subject: @contact.subject, from: "appdipre@gmail.cl")
    puts 2
  end
end
