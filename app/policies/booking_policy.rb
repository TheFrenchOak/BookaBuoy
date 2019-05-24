class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def confirm?
    record.buoy.user == user
  end

  def reject?
   record.buoy.user == user
  end
end
