class UserMailer < ApplicationMailer
  default from: "allr0undy0u@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user=user

    mail :to => @user.email, :from => "allr0undy0u@gmail.com", :subject => "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user=user

    mail :to => @user.email, :from => "allr0undy0u@gmail.com", :subject => "Password reset"
  end
end
