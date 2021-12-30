class ProductPolicy < ApplicationPolicy
  def create?
    user.has_role?(:admin)
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
