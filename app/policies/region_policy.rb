class RegionPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
