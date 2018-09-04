class AddTypeToMonsterClass < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_classes, :type, :string
  end
end
