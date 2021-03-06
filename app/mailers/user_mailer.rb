class UserMailer < ActionMailer::Base
  include Roadie::Rails::Automatic

  default from: "starseeker <noreply@#{Settings.url_options[:host]}>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = activate_url(user.activation_token)

    mail to: user.email, subject: '[starseeker] Verify your email'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user

    mail to: user.email, subject: '[starseeker] Succeeded your email verification'
  end
end
