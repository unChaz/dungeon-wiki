namespace :harvest do
  desc "Harvest Monsters from D&D Api"
  task monsters: :environment do
    response = Remote.monsters
    response[:results].each do |m|
      puts "Harvesting #{m[:name]}."
      m = Remote.populate(m)
      monster_class = MonsterClass.find_by(foreign_key: m[:index])
      if monster_class.nil?
        monster_class = MonsterClass.create
      end

      attributes = {
        foreign_key: m[:index],
        name: m[:name],
        armor_class: m[:armor_class],
        max_hit_points: m[:hit_points],
        hit_dice: m[:hit_dice],
        speed: m[:speed],
        strength: m[:strength],
        dexterity: m[:dexterity],
        constitution: m[:constitution],
        intelligence: m[:intelligence],
        wisdom: m[:wisdom],
        charisma: m[:charisma],
        stealth: m[:stealth],
        damage_vulnerabilities: m[:damage_vulnerabilities],
        damage_resistances: m[:damage_resistances],
        condition_immunities: m[:condition_immunities],
        senses: m[:senses],
        languages: m[:languages],
        url: m[:url]
      }

      monster_class.update_attributes(attributes)

    end
  end
end
