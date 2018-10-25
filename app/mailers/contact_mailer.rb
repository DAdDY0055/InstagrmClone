class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = Contact

    mail to: "", subject: "投稿確認メール"
  end
end
