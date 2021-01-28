class WigsController < ApplicationController
  def index
    # @wigs = Wig.all
    @wigs = policy_scope(Wig).order(created_at: :desc)
  end

  def create?
    return true
  end
  
  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
