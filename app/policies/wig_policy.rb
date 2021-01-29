class WigPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # for later:
      # scope.where(user: user)
    end
  end

    def index?
      true
    end

    def new?
      true
    end
    
    def create?
      record.user == user
    end
    
    def update?
      record.user == user
    end
  
    def destroy?
      record.user == user
    end
end
