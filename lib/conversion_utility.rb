class ConversionUtility
  XP_VALUES = {
    0 => 10,
    0.125 => 25,
    0.25 => 50,
    0.5 => 100,
    1 =>  200,
    2 =>  450,
    3 =>  700,
    4 =>  1_100,
    5 =>  1_800,
    6 =>  2_300,
    7 =>  2_900,
    8 =>  3_900,
    9 =>  5_000,
    10 => 5_900,
    11 => 7_200,
    12 => 8_400,
    13 => 10_000,
    14 => 11_500,
    15 => 13_000,
    16 => 15_000,
    17 => 18_000,
    18 => 20_000,
    19 => 22_000,
    20 => 25_000,
    21 => 33_000,
    22 => 41_000,
    23 => 50_000,
    24 => 62_000,
    30 => 155_000
  }.freeze

  DIFFICULTIES = {
    'easy': 0,
    'medium': 1,
    'hard': 2,
    'deadly': 3
  }.freeze

  XP_THREASHOLD = [
    ['easy', 'medium', 'hard', 'deadly'],
    [25, 50, 75, 100],
    [50, 100, 150, 200],
    [75, 150, 225, 400],
    [125, 250, 375, 500],
    [250, 500, 750, 1_100],
    [300, 600, 900, 1_400],
    [350, 750, 1_100, 1_700],
    [450, 900, 1_400, 2_100],
    [550, 1_100, 1_600, 2_400],
    [600, 1_200, 1_900, 2_800],
    [800, 1_600, 2_400, 3_600],
    [1_000, 2_000, 3_000, 4_500],
    [1_100, 2_200, 3_400, 5_100],
    [1_250, 2_500, 3_800, 5_700],
    [1_400, 2_800, 4_300, 6_400],
    [1_600, 3_200, 4_800, 7_200],
    [2_000, 3_900, 5_900, 8_800],
    [2_100, 4_200, 6_300, 9_500],
    [2_400, 4_900, 7_300, 10_900],
    [2_800, 5_700, 8_500, 12_700]
  ].freeze
end
