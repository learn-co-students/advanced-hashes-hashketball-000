# Write your code here!
require 'pry'

def game_hash

	return game_hash = 
		{
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
						:assists =>6,
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

def home_team_name
  return game_hash[:away][:players]["Jeff Adrien"][:points]
end

 
def good_practices
	game_hash.each do |location, team_data|
		#are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
		#binding.pry
		team_data.each do |attribute, data|
      	#are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      	#binding.pry
			#what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
			data.each do |data_item|
					binding.pry
    		end
  		end
	end
end
#good_practices


def num_points_scored(name)
  #player.capitalize!
  if game_hash[:home][:players].include?(name)
	x = game_hash[:home][:players][name][:points]
  elsif game_hash[:away][:players].include?(name)
   x = game_hash[:away][:players][name][:points]
  # puts "in elsif"
  # puts game_hash[:away][:players][name][:points]
  else
   "No player found."
  end
  return x
end

def shoe_size(name)
  #player.capitalize!
  if game_hash[:home][:players].include?(name)
	x = game_hash[:home][:players][name][:shoe]
  elsif game_hash[:away][:players].include?(name)
   x = game_hash[:away][:players][name][:shoe]
   #puts "in elsif"
   #puts game_hash[:away][:players][name][:shoe]
  else
   "No player found."
  end
  return x
end

def team_colors(name)
  #player.capitalize!
  ary = Array.new
  if game_hash[:home][:team_name].include?(name)
	ary[0] = game_hash[:home][:colors][0]
	ary[1] = game_hash[:home][:colors][1]
  elsif game_hash[:away][:team_name].include?(name)
	ary[0] = game_hash[:away][:colors][0]
	ary[1] = game_hash[:away][:colors][1]
  else
   "No player found."
  end
  return ary
end

def team_names
  #player.capitalize!
  ary = Array.new
	ary[0] = game_hash[:home][:team_name]
	ary[1] = game_hash[:away][:team_name]
  return ary
end

def player_numbers(name)
	player_numbers = []
	if game_hash[:home][:team_name].include?(name)
		sym = :home
   else
  		sym = :away
  	end

	game_hash[sym][:players].each_value do |x|
		player_numbers << x[:number]
	end

	return player_numbers
end




def player_stats(name)
  #player.capitalize!
	if game_hash[:home][:players].include?(name)
		game_hash[:home][:players][name].each do |name, stat|
			#puts "#{name}=>#{stat}"
		end
	elsif game_hash[:away][:players].include?(name)
		game_hash[:away][:players][name].each do |name, stat|
			#puts "#{name}=>#{stat}"
		end
	end
end

#player_stats("Jeff Adrien")

def big_shoe_rebounds
  	bigShoe = 0
  	currShoe = 0
  	currRebound = 0
  	highRebound = 0
  	
	game_hash[:home][:players].each do |name, stat|
		stat.each do |stat, number|
			if (stat == "rebounds".to_sym)
				currRebound = number
			end
			if (stat == "shoe".to_sym)
				currShoe = number
			end
		end
		if currShoe > bigShoe
			bigShoe = currShoe
			highRebound = currRebound
		end
	end

	game_hash[:away][:players].each do |name, stat|
		stat.each do |stat, number|
			if (stat == "rebounds".to_sym)
				currRebound = number
			end
			if (stat == "shoe".to_sym)
				currShoe = number
			end
		end
		if currShoe > bigShoe
			bigShoe = currShoe
			highRebound = currRebound
		end
	end
	return highRebound
end
big_shoe_rebounds