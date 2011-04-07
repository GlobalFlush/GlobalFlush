# Notifier
# Actions for sending password reset instruction
class Notifier < ActionMailer::Base
  default :from => "no-reply@globalflush.com"

  # Settings for deliver password reset instruction
  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "Global Flush<no-reply@globalflush.com>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
  
end
