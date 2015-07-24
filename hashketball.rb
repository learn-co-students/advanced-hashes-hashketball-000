# Write your code here!
require 'pry'

def game_hash
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number:      0,
          shoe:       16,
          points:     22,
          rebounds:   12,
          assists:    12,
          steals:      3,
          blocks:      1,
          slam_dunks:  1
        },
        "Reggie Evans" => {
          number:     30,
          shoe:       14,
          points:     12,
          rebounds:   12,
          assists:    12,
          steals:     12,
          blocks:     12,
          slam_dunks:  7
        },
        "Brook Lopez" => {
          number:     11,
          shoe:       17,
          points:     17,
          rebounds:   19,
          assists:    10,
          steals:      3,
          blocks:      1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number:      1,
          shoe:       19,
          points:     26,
          rebounds:   12,
          assists:     6,
          steals:      3,
          blocks:      8,
          slam_dunks:  5
        },
        "Jason Terry" => {
          number:     31,
          shoe:       15,
          points:     19,
          rebounds:    2,
          assists:     2,
          steals:      4,
          blocks:     11,
          slam_dunks:  1
        }
      }
      },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number:      4,
          shoe:       18,
          points:     10,
          rebounds:    1,
          assists:     1,
          steals:      2,
          blocks:      7,
          slam_dunks:  2
        },
        "Bismak Biyombo" => {
          number:      0,
          shoe:       16,
          points:     12,
          rebounds:    4,
          assists:     7,
          steals:      7,
          blocks:     15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number:      2,
          shoe:       14,
          points:     24,
          rebounds:   12,
          assists:    12,
          steals:      4,
          blocks:      5,
          slam_dunks:  5
        },
        "Ben Gordon" => {
          number:      8,
          shoe:       15,
          points:     33,
          rebounds:    3,
          assists:     2,
          steals:      1,
          blocks:      1,
          slam_dunks:  0
        },
        "Brendan Haywood" => {
          number:     33,
          shoe:       15,
          points:      6,
          rebounds:   12,
          assists:    12,
          steals:     22,
          blocks:      5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game = game_hash
  points = nil
  if game[:home][:players].has_key?(player)
    points = game[:home][:players][player][:points]
  elsif game[:away][:players].has_key?(player)
    points = game[:away][:players][player][:points]
  end
  points
end

def shoe_size(player)
  game = game_hash
  shoe = nil
  if game[:home][:players].has_key?(player)
    shoe = game[:home][:players][player][:shoe]
  elsif game[:away][:players].has_key?(player)
    shoe = game[:away][:players][player][:shoe]
  end
  shoe
end

def team_colors(team)
  game = game_hash
  colors = nil
  if game[:home][:team_name] == team
    colors = game[:home][:colors]
  elsif game[:away][:team_name] == team
    colors = game[:away][:colors]
  end
  colors
end

def team_names
  game = game_hash
  teams = []
  teams << game[:home][:team_name]
  teams << game[:away][:team_name]
  teams
end

def player_numbers(team)
  game = game_hash
  numbers = []
  if game[:home][:team_name] == team
    game[:home][:players].each do |player, stats|
      numbers << stats[:number]
    end
  elsif game[:away][:team_name] == team
    game[:away][:players].each do |player, stats|
      numbers << stats[:number]
    end
  end
  numbers
end

def player_stats(player)
  game = game_hash
  stats = nil
  if game[:home][:players].has_key?(player)
    stats = game[:home][:players][player]
  elsif game[:away][:players].has_key?(player)
    stats = game[:away][:players][player]
  end
  stats
end

def big_shoe_rebounds
  game = game_hash
  biggest_shoe_size = 0
  number_of_rebounds = 0
  game[:home][:players].each do |player, stats|
    if stats[:shoe] > biggest_shoe_size
      number_of_rebounds = stats[:rebounds]
    end
  end
  game[:away][:players].each do |player, stats|
    if stats[:shoe] > biggest_shoe_size
      number_of_rebounds = stats[:rebounds]
    end
  end
  number_of_rebounds
end






