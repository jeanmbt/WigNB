class WigPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.all
    end
    def
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
end
