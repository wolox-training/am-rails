class RentMailer < ApplicationMailer
  def rent_confirmation
    @user = rent.user
    @book = rent.book

    mail(to: @user.email, subject: t('.title', title: @book.title))
  end

  def rent_expiry
    @user = rent.user
    @book = rent.book

    mail(to: @user.email, subject: t('.title', title: @book.title))
  end

  private

  def rent
    @rent ||= Rent.find(params[:rent_id])
  end
end
