class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
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
