require "pry"

def game_hash
  hash={
    home:{
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:[
      {player_name: "Alan Anderson",
number: 0,
shoe: 16,
points: 22,
rebounds: 12,
assists: 12,
steals: 3,
blocks: 1,
slam_dunks: 1
},
{
player_name: "Reggie Evans",
number: 30,
shoe: 14,
points: 12,
rebounds: 12,
assists: 12,
steals: 12,
blocks: 12,
slam_dunks: 7
},
{
player_name: "Brook Lopez",
number: 11,
shoe: 17,
points: 17,
rebounds: 19,
assists: 10,
steals: 3,
blocks: 1,
slam_dunks: 15
},
{
player_name: "Mason Plumlee",
number: 1,
shoe: 19,
points: 26,
rebounds: 11,
assists: 6,
steals: 3,
blocks: 8,
slam_dunks: 5
},
{
player_name: "Jason Terry",
number: 31,
shoe: 15,
points: 19,
rebounds: 2,
assists: 2,
steals: 4,
blocks: 11,
slam_dunks: 1
},
] },

    away:{ team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
    players:[
      {
player_name: "Jeff Adrien",
number: 4,
shoe: 18,
points: 10,
rebounds: 1,
assists: 1,
steals: 2,
blocks: 7,
slam_dunks: 2
},
{
player_name: "Bismack Biyombo",
number: 0,
shoe: 16,
points: 12,
rebounds: 4,
assists: 7,
steals: 22,
blocks: 15,
slam_dunks: 10
},
{
player_name: "DeSagna Diop",
number: 2,
shoe: 14,
points: 24,
rebounds: 12,
assists: 12,
steals: 4,
blocks: 5,
slam_dunks: 5
},
{
player_name: "Ben Gordon",
number: 8,
shoe: 15,
points: 33,
rebounds: 3,
assists: 2,
steals: 1,
blocks: 1,
slam_dunks: 0
},
{
player_name: "Kemba Walker",
number: 33,
shoe: 15,
points: 6,
rebounds: 12,
assists: 12,
steals: 7,
blocks: 5,
slam_dunks: 12
},
] }
    }
return hash
end

def num_points_scored(player)
 game_hash[:home][:players].select{ |item| 
 if item[:player_name] == player 
 return item[:points]
end
 }
  game_hash[:away][:players].select{ |item| 
 if item[:player_name] == player 
 return item[:points]
end
 }
end
def shoe_size(player)
 game_hash[:home][:players].select{ |item| 
 if item[:player_name] == player 
 return item[:shoe]
end
 }
  game_hash[:away][:players].select{ |item| 
 if item[:player_name] == player 
 return item[:shoe]
end
 }
end

def team_colors(team)
 if game_hash[:home][:team_name] == team 
 return game_hash[:home][:colors]
 
 elsif game_hash[:away][:team_name] == team 
 return game_hash[:away][:colors]
end
 
end
def team_names()
 t_names=[]
 game_hash.each{|key, value|
 t_names.push(value[:team_name])}
 return t_names
end

def player_numbers(team)
 player_num=[]
 
 if game_hash[:home][:team_name] == team 
 game_hash[:home][:players].select{|item| 
 player_num.push(item[:number])}
 
 elsif game_hash[:away][:team_name] == team 
 game_hash[:away][:players].select{|item| 
 player_num.push(item[:number])}
end
return player_num
end

def player_stats(player)
 
  game_hash[:home][:players].select{|item| 
 if item[:player_name]==player
   item.delete(:player_name)
   return item
 end
 }
 game_hash[:away][:players].select{|item| 
 if item[:player_name]==player
   item.delete(:player_name)
   return item
 end
 }
 
end

def big_shoe_rebounds
  bigest_size=0
  rebound=0
   game_hash.each{|key1, value1| value1[:players].select{|item| 
 if item[:shoe]>bigest_size
   bigest_size=item[:shoe]
   rebound=item[:rebounds]
 end
 }}
 return rebound
end

def most_points_scored
  most_points=0
   player=""
   game_hash.each{|key1, value1| value1[:players].select{|item| 
 if item[:points]>most_points
   most_points=item[:points]
   player=item[:player_name]
 end
 }}
 return player
end
  
  def winning_team
   home_team=0
away_team=0
  
 game_hash[:home][:players].select{ |item| 
 home_team += item[:points]
 #team1_name=item[:team_name]
 }
  game_hash[:away][:players].select{ |item| 
 away_team+=item[:points]
 #team2_name=item[:team_name]
 }
 if home_team>away_team
   return game_hash[:home][:team_name]
 else
   return game_hash[:away][:team_name]
 end
 end
 
 def player_with_longest_name
   longest=""
   game_hash.each_value{|obj1| obj1[:players].select{|item|
   if item[:player_name].length>longest.length
   longest=item[:player_name]
   end }}
   return longest
 end
 
 def long_name_steals_a_ton?
   name=player_with_longest_name
   most=0
   game_hash.each_value{|obj1| obj1[:players].select{|item|
   if item[:player_name]==name
   most=item[:steals]
   end 
     }}
     game_hash.each_value{|obj1| obj1[:players].select{|item|
   if item[:steals]>most
   return false
   end 
     }}
     return true
 end
  

