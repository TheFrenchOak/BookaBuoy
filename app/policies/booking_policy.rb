class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.select { |booking| booking.user == user }
    end

    def owner
      scope.select { |booking| booking.buoy.user == user }
    end
  end

  def create?
    true
  end

  def confirm?
    record.buoy.user == user
  end

  def reject?
    record.buoy.user == user
  end
end
