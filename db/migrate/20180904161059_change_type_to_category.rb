class ChangeTypeToCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :monster_classes, :type, :string
    add_column :monster_classes, :category, :string
  end
end
