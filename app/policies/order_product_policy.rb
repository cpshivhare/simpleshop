class OrderProductPolicy < ApplicationPolicy
  def create?
    record.order.user == user
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

#   class Scope < Scope
#     def resolve
#       scope.where(user: )
#     end
#   end
end
