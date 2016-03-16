class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
<<<<<<< HEAD
    mail(to: @user.email , subject: "Welcome to TutorU")
=======
    mail(to: @user.email , subject: "welcome")
>>>>>>> f3cf0f68c71b771274bcc9b1d7c6871d417df561
  end

end
