class AddMonsterClassIdToMonsterPools < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_pools, :monster_class_ids, :integer, array: true, default: []
  end
end
