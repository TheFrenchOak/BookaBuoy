class BuoyPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end
  class Scope < Scope
    def resolve
      scope.where.not(latitude: nil, longitude: nil)
    end
  end
end
