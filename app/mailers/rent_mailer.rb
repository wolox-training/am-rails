class RentMailer < ApplicationMailer
  def rent_confirmation
    rent_id = params[:rent_id]
    @rent = Rent.find(rent_id)
    @user = @rent.user
    @book = @rent.book

    mail(to: @user.email, subject: t('.title', title: @book.title))
  end

  def rent_expiry
    rent_id = params[:rent_id]
    @rent = Rent.find(rent_id)
    @user = @rent.user
    @book = @rent.book

    mail(to: @user.email, subject: t('.title', title: @book.title))
  end
end
