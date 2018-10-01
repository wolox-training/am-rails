class RentMailer < ApplicationMailer
  def rent_confirmation
    @user = params[:user]
    mail(to: @user.email, subject: 'Rent Confirmation Email')
  end
end
