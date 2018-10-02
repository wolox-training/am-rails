class RentMailer < ApplicationMailer

  def rent_confirmation
    rent_id = params[:rent_id]
    @rent = Rent.find(rent_id)
    @user = @rent.user
    @book = @rent.book
    mail(to: @user.email, subject: 'Rent Confirmation Email')
  end
end
