
# Write your code here!
require 'pry'

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  num_points = nil
  game_hash.each do |team, attributes|
    if attributes[:players].keys.include?(player_name)
      num_points = attributes[:players][player_name][:points]
    end
  end

  num_points
end

def shoe_size(player_name)
  game_hash.each do |team, team_attributes|
    if team_attributes[:players].keys.include?(player_name)
      return team_attributes[:players][player_name][:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_attributes|
    if team_attributes[:team_name] == team_name
      return team_attributes[:colors]
    end
  end
end

def team_names
  game_hash.map do |teams, team_attributes|
    team_attributes[:team_name]
  end
end

def player_numbers(team_name)
  game_hash.map do |teams, team_attributes|
    team_attributes[:players].map do |player_name, player_attributes|
      player_attributes[:number] if team_attributes.values.include?(team_name)
    end
  end.flatten.compact
end

def player_stats(player_name)
  game_hash.each do |teams, team_attributes|
    if team_attributes[:players].keys.include?(player_name)
      return team_attributes[:players][player_name]
    end
  end
end

def big_shoe_rebounds
  largest_shoes_last = nil
  number_of_rebounds = nil
  game_hash.map do |team, team_attributes|
    team_attributes[:players]
  end.flatten.each do |players_hash|
    players_hash.each do |player, player_attributes|
      shoes = player_attributes[:shoe]
      if largest_shoes_last == nil || shoes > largest_shoes_last
        largest_shoes_last = shoes
        number_of_rebounds = player_attributes[:rebounds]
      end
    end
  end
  number_of_rebounds
end

def most_points_scored
  most_points_scored = nil
  player_with_most_points = ""
  game_hash.map do |team, team_attributes|
    team_attributes[:players]
  end.flatten.each do |player_array|
    player_array.each do |player, player_attributes|
      player_score = player_attributes[:points]
      if most_points_scored == nil || player_score > most_points_scored
        most_points_scored = player_score
        player_with_most_points = player
      end
    end
  end
  player_with_most_points
end
