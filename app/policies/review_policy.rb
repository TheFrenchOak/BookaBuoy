class ReviewPolicy < ApplicationPolicy

  def new?
    create?
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(booking.user == user)
    end
  end
end
