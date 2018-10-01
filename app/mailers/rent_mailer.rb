class RentMailer < ApplicationMailer
  def rent_confirmation
    @rent = params[:rent]
    @user = @rent.user
    @book = @rent.book
    mail(to: @user.email, subject: 'Rent Confirmation Email')
  end
end
