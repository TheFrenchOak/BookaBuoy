class BookingPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end