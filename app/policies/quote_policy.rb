class QuotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def pdf?
    true
  end
  
  def show?
    true
  end
  
  def create?
    true
  end
  
  def update?
    true
  end
  
  def destroy?
    true
  end
end