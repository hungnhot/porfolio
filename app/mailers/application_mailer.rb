class ApplicationMailer < ActionMailer::Base
  default from: 'hungnhottest@gmail.com'

  def contact_email(receive_email, content)
    @content = content
    mail(to: receive_email, subject: '[Porfolio page] Contact')
  end

end
