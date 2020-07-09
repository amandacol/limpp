class CombinationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def rails_admin?(action)
    case action
      when :destroy, :new, :edit, :update, :create
        false
      else
        super
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

end
