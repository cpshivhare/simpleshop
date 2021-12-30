class Role < ApplicationRecord
  validates :name, inclusion: { in: %w[customer admin],
                                message: 'Invalid role %{value}.' }

  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify

  def updatable_by?(user)
    resource.author == user || user.has_role?(:admin)
  end
end
