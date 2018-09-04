class ChangeMonsterClassChallengeRatingToFloat < ActiveRecord::Migration[5.0]
  def change
    remove_column :monster_classes, :challenge_rating
    add_column :monster_classes, :challenge_rating, :float
  end
end
