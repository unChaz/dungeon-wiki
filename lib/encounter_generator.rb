class EncounterGenerator
  def initialize(params = {})
    @party_size = params[:party_size] || 4
    @party_level = params[:party_level] || 1
    @difficulty = ConversionUtility::DIFFICULTIES[params[:difficulty].to_sym || :medium]
    @monster_pool = params[:monster_pool]
    @max_monster_count = params[:max_monster_count] || 8
    @monster_type_limit = params[:monster_type_limit] || 3
    @max_cr = params[:max_cr] || 30
    @min_cr = params[:min_cr] || 0
    @xp_threshold = xp_threshold
    @minimum_encounter_xp = xp_threshold * 0.80
    @eligable_monsters = eligable_monsters
    @xp_hash = xp_hash
    puts "XP Threshold: #{@xp_threshold}"
  end

  def generate_one
    generate_list.sample
  end

  def generate_list
    encounters = []
    permutations.each do |permutation|
      fill_permutation!(permutation)
    end.each do |encounter|
      if count_encounter_size(encounter) <= @max_monster_count
        encounters << encounter
      end
    end
    encounters
  end

  def fill_permutation!(permutation)
    total_xp = count_encounter_xp(permutation)
    remaining = xp_threshold - total_xp

    min_monster_xp = nil
    permutation.each do |monster|
      if min_monster_xp.nil? || monster[:experience] < min_monster_xp
        min_monster_xp = monster[:experience]
      end
    end

    while total_xp < @minimum_encounter_xp
      permutation.each do |monster|
        remaining = xp_threshold - total_xp

        if monster[:experience] <= remaining
          monster[:count] = monster[:count] + 1
          total_xp += monster[:experience]
        end
      end

      if remaining < min_monster_xp
        total_xp = xp_threshold
      end
    end
  end

  def permutations
    perms = []
    sample_amount = [@xp_hash.count, 10].min
    @monster_type_limit.times do |i|
      perms = perms + @xp_hash.sample(sample_amount).permutation(i + 1).to_a
    end
    perms
  end

  private

  def count_encounter_size(encounter)
    encounter.inject(0) do |sum,x|
      sum + x[:count]
    end
  end

  def populate_encounter(encounter)
    encounter[:monster_class]
  end

  def count_encounter_xp(encounter)
    encounter.inject(0) do |sum,x|
      sum + (x[:experience] * x[:count])
    end
  end

  def xp_hash
    @eligable_monsters.to_a.map do |monster|
      {
        id: monster[:id],
        name: monster[:name],
        experience: monster[:experience],
        count: 1
      }
    end
  end

  def count_xp(monster_list)
    xp = 0
    monster_list.each do |monster|
      xp = xp + monster[:experience]
    end
    xp
  end

  def eligable_monsters
    monsters.where('experience <= ?', xp_threshold)
  end

  def monsters
    if @monster_pool.present?
      MonsterClass.where(id: @monster_pool.monster_class_ids)
    else
      MonsterClass.all
    end
  end

  def xp_threshold
    @xp_threshold ||= player_xp_threshold * @party_size
  end

  def player_xp_threshold
    ConversionUtility::XP_THREASHOLD[@party_level][@difficulty]
  end
end
