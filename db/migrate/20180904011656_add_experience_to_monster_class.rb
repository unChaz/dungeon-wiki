class AddExperienceToMonsterClass < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_classes, :experience, :integer
  end
end
