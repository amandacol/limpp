class NewitemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def new?
    return true
  end
  def create?
    return true
  end
  def show?
    return true
  end
  def index?
    return true
  end
end
