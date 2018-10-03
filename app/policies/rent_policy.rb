class RentPolicy < ApplicationPolicy
  def index?
    record.empty? ? true : user.id == record[0].user_id
  end

  def create?
    record.user_id == user.id
  end
end
