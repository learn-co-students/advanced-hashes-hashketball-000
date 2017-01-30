require 'pry'
# Write your code here!
def game_hash

game_hash = 
{
    home: 
    {
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: 
        [
            {player_name: "Alan Anderson",
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals:  3,
            blocks: 1,
            slam_dunks: 1},

          {player_name: "Reggie Evans",
            number:  30,
            shoe:  14,
            points:  12,
            rebounds:  12,
            assists:  12,
            steals:  12,
            blocks:  12,
            slam_dunks:  7},

          {player_name:  "Brook Lopez",
            number:  11,
            shoe:  17,
            points:  17,
            rebounds:  19,
            assists:  10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15},
          
            {player_name: "Mason Plumlee",
            number: 1,
            shoe: 19,
            points:  26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5},

            {player_name: "Jason Terry",
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1}
        ]
    },
    away: 
    {
        team_name: "Charlotte Hornets",
        colors: ["Turquoise", "Purple"],
        players: 
        [
            {player_name: "Jeff Adrien",
              number: 4,
              shoe: 18,
              points: 10,
              rebounds: 1,
              assists: 1,
              steals: 2,
              blocks: 7,
              slam_dunks: 2
            },

            {player_name: "Bismak Biyombo",
              number: 0,
              shoe: 16,
              points: 12,
              rebounds: 4,
              assists: 7,
              steals: 7,
              blocks: 15,
              slam_dunks: 10,
            },

            {player_name: "DeSagna Diop",
              number: 2,
              shoe: 14,
              points: 24,
              rebounds: 12,
              assists: 12,
              steals: 4,
              blocks: 5,
              slam_dunks: 5
            },

            {player_name: "Ben Gordon",
              number: 8,
              shoe: 15,
              points: 33,
              rebounds: 3,
              assists: 2,
              steals: 1,
              blocks: 1,
              slam_dunks: 0
            },

            {player_name: "Brendan Haywood",
              number: 33,
              shoe: 15,
              points: 6,
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

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTLY SURE what 'location' and team data are?
    #binding.pry
      team_data.each do |attribute, data|
        #are you absolutley sure what 'attribute' and 'team data are?
        binding.pry
          #what is 'data' at each loop through out .each block? when will
          #the following line of code work and when will it break?
          if attribute == :players
            data.each do |data_item|
             binding.pry
            end
          end
      end
  end
end

def num_points_scored(player_name)
  #reference: game_hash[:away][:players][0][:points]
  game_hash.each do |location, team_data| #all hash data

      team_data.each do |players, players_array| #team data AFTER location(home/away)
        
        if players == :players #want only hashes of players
            
            players_array.each do |player_hash, player_keys| #players hashes are in an array
              player_hash.each do |player_attributes, player_data| #individuals stats

                if player_data == player_name
                  return player_hash[:points] #return their points scored
                end

              end
            end
        end
      end
  end
end

def shoe_size(player_name)
  #reference: game_hash[:away][:players][0][:points]
  game_hash.each do |location, team_data| #all hash data

      team_data.each do |players, players_array| #team data AFTER location(home/away)
        
        if players == :players #want only hashes of players
            
            players_array.each do |player_hash, player_keys| #players hashes are in an array
              player_hash.each do |player_attributes, player_data| #individuals stats

                if player_data == player_name
                  return player_hash[:shoe] #return their points scored
                end

              end
            end
        end
      end
  end
end


# ####REFACTORED ABOVE
# def shoe_size(player_name)


#   #reference: game_hash[:away][:players][0][:points]
#   game_hash.each do |location, team_data| #all hash data

#       team_data.each do |players, players_array| #team data AFTER location(home/away)
        
#         if players == :players #want only hashes of players
            
#             players_array.each do |player_hash, player_keys| #players hashes are in an array
#               player_hash.each do |player_attributes, player_data| #individuals stats

#                 if player_data == player_name
#                   return player_hash[:shoe] #return their points scored
#                 end

#               end
#             end
#         end
#       end
#   end
# end



def team_colors(team_name)
  result_array = []
  game_hash.each do |location, team_data| #all hash data
    team_data.each do |team_keys, team_values| #team data AFTER location(home/away)
      if team_values == team_name
          return team_data[:colors]
      end 
    end
  end
end


def team_names
  result_array = []
  game_hash.each do |location, team_data|
    team_data.each do |team_keys, team_values|
      if team_keys == :team_name
        result_array << team_values
      end
    end
  end
  result_array
end

def player_numbers(team_name)
  result_array = []
  game_hash.each do |location, team_data|
    team_data.each do |team_key, team_values|
      if team_values == team_name

        team_data[:players].each do |player_hash| #players hashes are in an array
          player_hash.each do |key, value|
            if key == :number
              result_array << value
            end
          end   
        end
      end
    end
  end
  result_array
end

def big_shoe_rebounds
  largest_shoe = 0
  number_of_rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |key, value|
        if player_hash[:shoe] > largest_shoe
          largest_shoe = player_hash[:shoe]
          number_of_rebounds = player_hash[:rebounds]
        end
      end
    end
  end
  number_of_rebounds
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    #team_data.each do |team_key, team_values|
      team_data[:players].each do |player_hash|
        player_hash.each do |k, v|
          if v == player_name
            return player_hash.delete_if {|key, value| key == :player_name}
          end
        end
      end
     # end
    end
  end



puts team_names.class
puts team_colors("Charlotte Hornets").class
puts player_numbers("Brooklyn Nets")
puts player_stats("Alan Anderson")
puts big_shoe_rebounds

=begin
  
rescue game_hash = 
{
    home: 
    {
        team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: 
        [
            {player_name: "Alan Anderson",
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals:  3,
            blocks: 1,
            slam_dunks: 1}, => e
  
=end


























