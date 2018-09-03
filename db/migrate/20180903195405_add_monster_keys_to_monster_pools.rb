class AddMonsterKeysToMonsterPools < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_pools, :keys, :string, array: true, default: []
  end
end
