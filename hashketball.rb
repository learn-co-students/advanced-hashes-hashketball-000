def game_hash
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: {
        'Alan Anderson' => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        'Reggie Evans' => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        'Brook Lopez' => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        'Mason Plumlee' => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        'Jason Terry' => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        'Jeff Adrien' => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        'Bismak Biyombo' => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        'DeSagna Diop' => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        'Ben Gordon' => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        'Brendan Haywood' => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored name
  num_points = nil
  game_hash.each do |side, team_stats|
    team_stats[:players].each do |player, player_stats|
      if player == name
        num_points = player_stats[:points]
      end
    end
  end
  num_points
end

def shoe_size name
  shoe_size = nil
  game_hash.each do |side, team_stats|
    team_stats[:players].each do |player, player_stats|
      if player == name
        shoe_size = player_stats[:shoe]
      end
    end
  end
  shoe_size
end

def team_colors team
  team_colors = nil
  game_hash.each do |side, team_stats|
    team_stats.each do |stat, data|
      if data == team
        team_colors = team_stats[:colors]
      end
    end
  end
  team_colors
end

def team_names
  teams = []
  game_hash.each do |side, team_stats|
    team_stats.each do |stat, data|
      if stat == :team_name
        teams << data
      end
    end
  end
  teams
end

def player_numbers team
  numbers = []
  game_hash.each do |side, team_stats|
    if team_stats[:team_name] == team
      team_stats[:players].each do |player, player_stats|
        numbers << player_stats[:number]
      end
    end
  end
  numbers
end

def player_stats name
  stats = nil
  game_hash.each do |side, team_stats|
    team_stats[:players].each do |player, player_stats|
      if player == name
        stats = player_stats
      end
    end
  end
  stats
end

def big_shoe_rebounds
  shoe_sizes_with_rebounds = []
  game_hash.each do |side, team_stats|
    team_stats[:players].each do |player, player_stats|
      shoe_sizes_with_rebounds << { player_stats[:shoe] => player_stats[:rebounds]}
    end
  end

  largest = 0
  scores = 0
  shoe_sizes_with_rebounds.each do |data|
    data.each do |size, rebounds|
      if size > largest
        largest = size
        scores = rebounds
      end
    end
  end
  scores
end
