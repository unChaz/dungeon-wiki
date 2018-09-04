class AddRemainingFieldsToMonsterClass < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_classes, :size, :string
    add_column :monster_classes, :medicine, :integer
    add_column :monster_classes, :religion, :integer
    add_column :monster_classes, :persuasion, :integer
    add_column :monster_classes, :insight, :integer
    add_column :monster_classes, :deception, :integer
    add_column :monster_classes, :arcana, :integer
    add_column :monster_classes, :athletics, :integer
    add_column :monster_classes, :acrobatics, :integer
    add_column :monster_classes, :strength_save, :integer
    add_column :monster_classes, :reactions, :text, array: true, default: []
    add_column :monster_classes, :survival, :integer
    add_column :monster_classes, :investigation, :integer
    add_column :monster_classes, :nature, :integer
    add_column :monster_classes, :intimidation, :integer
    add_column :monster_classes, :performance, :integer
  end
end
