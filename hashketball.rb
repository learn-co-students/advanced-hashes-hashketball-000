require 'pry'

def game_hash()
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        { player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          num_points_scored: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        { player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          num_points_scored: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        { player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          num_points_scored: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        { player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          num_points_scored: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        { player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          num_points_scored: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
       }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        { player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          num_points_scored: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        { player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          num_points_scored: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        { player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          num_points_scored: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        { player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          num_points_scored: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        { player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          num_points_scored: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
       }
      ]
    }
  }
end

def num_points_scored(player)
  points = 0
  game_hash.each{|location, data|
    data.each{|cat_type, cat_value|
      if cat_type == :players
        cat_value.each{|stat_hash|
          if stat_hash[:player_name] == "#{player}"
            points = stat_hash[:num_points_scored]
          end
        }
      end
    }
  }
  points 
end

def shoe_size(player)
  size = 0
  game_hash.each{|location, data|
    data.each{|cat_type, cat_value|
      if cat_type == :players
        cat_value.each{|stat_hash|
          if stat_hash[:player_name] == "#{player}"
            size = stat_hash[:shoe]
          end
        }
      end
    }
  }
  size 
end

def team_colors(team_name)
  colors = "not a team"
  game_hash.each{|location, data| 
    if data[:team_name] == team_name
    colors = data[:colors]
    end
  }
  colors
end

def team_names
  teams = []
  game_hash.each{|location, data|
    teams << data.select{|data_type, data_value| data_type == :team_name}.values
  }
  teams.flatten
end

def player_numbers(team_name)
  jerseys = []
  game_hash.each{|location, data|
    data.each{|data_type, data_value|
      if data_type == :team_name && data_value == team_name
        game_hash[location][:players].each{|player_stats|
          jerseys << player_stats.select{|stat_type,stat_value| stat_type == :number}.values
        }
      end
    }
  }
  jerseys.flatten
end

def player_stats(player_name)
  stats = {}
  game_hash.each{|location, data|
    data.each{|data_type, data_value|
      if data_type == :players
        data_value.each{|player_stats|
          player_stats.each{|stat_type,stat_value|
            if stat_value == player_name      
              stats = player_stats
              stats.shift
            end
          }
        }
      end
    }
  }
  stats[:points] = stats[:num_points_scored]
  stats.delete_if{|x,y| x == :num_points_scored}
  stats
end

def big_shoe_rebounds
  big_shoe_array = []
  game_hash.each{|location, data|
    data.each{|data_type, data_value|
      if data_type == :players
        data_value.each{|player|
          player.each{|stat_type, stat_value|
            if stat_type == :player_name 
              shoe_hash = Hash.new
              shoe_hash[stat_type] = stat_value
              shoe_hash[:shoe] = player[:shoe]
              shoe_hash[:rebounds] = player[:rebounds]
              big_shoe_array << shoe_hash
            end
          }
        }
      end
    }
  }
  big_shoe_array.sort_by{|player| player[:shoe]}.pop[:rebounds]
end

