class BuoyPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def edit?
    update?
  end

  def destroy?
    record.user == user
  end

  def mybuoys?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
