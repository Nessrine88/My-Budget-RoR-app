class CreateEntitiesGroupsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :entities_groups, id: false do |t|
      t.belongs_to :entity
      t.belongs_to :group
    end

    add_index :entities_groups, [:entity_id, :group_id]
  end
end
