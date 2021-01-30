class WigPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # for later:
      # scope.where(user: user)
    end
  end
  
    def show?
      true
    end
    def index?
      true
    end

    def new?
      true
    end
    
    def create?
      true
    end
    
    def update?
      record.user == user
    end
  
    def destroy?
      record.user == user
    end
end
