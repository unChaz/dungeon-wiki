namespace :harvest do
  desc "Harvest Monsters from D&D Api"
  task monsters: :environment do
    missing_keys = []
    response = Remote.monsters
    response[:results].each do |m|
      m = Remote.populate(m)
      monster_class = MonsterClass.find_by(foreign_key: m[:index])
      if monster_class.nil?
        puts "Harvesting #{m[:name]}."
        monster_class = MonsterClass.create
      else
        puts "Updating #{m[:name]}."
      end

      keys = MonsterClass.new.attributes.keys - ["id"]
      attributes = Hash.new

      keys.each do |key|
        value = m[key.to_sym]
        next if value.nil?
        if value.is_a?(Array)
          value = value.map do |item|
            item = item.to_json
          end
        elsif value.is_a?(Hash)
          value = value.to_json
        end
        attributes[key.to_sym] = value
      end

      foreign_keys = m.keys - [:_id, :index, :type, :hit_points]
      (foreign_keys).each do |key|
        unless keys.include? key.to_s
          missing_keys << key
        end
      end

      attributes[:category] = m[:type]

      experience = ConversionUtility::XP_VALUES[attributes[:challenge_rating]]
      attributes[:experience] = experience

      monster_class.update_attributes(attributes)

    end

    missing_keys.uniq.each do |key|
      puts "Missing Key: #{key}"
    end

    if missing_keys.count == 0
      puts "No Missing Keys!!"
    end
  end
end
