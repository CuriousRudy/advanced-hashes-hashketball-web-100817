require 'pry'

def game_hash #working
    {:home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"],:players => {
            "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1 },
            "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7 },
            "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15 },
            "Mason Plumlee" => { :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5 },
            "Jason Terry"=> { :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1 }
    }},
    :away => { :team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => {
            "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2 },
            "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10 },
            "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5 },
            "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0 },
            "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12 },
        }},
    }
end

def num_points_scored(name) #working
    points_scored = 0
    game_hash.each do |location, info|
        info.each do |key, team_info|
            if key == :players
                team_info.each do |player, stats|
                    if player == name
                        stats.find do |stat, val|
                            if stat == :points
                              points_scored = val
                              end
                        end
                    end
                end
            end
            end
        end
        points_scored
end
    
    
    
def player_numbers(name) #working
    player_num_array = []
    game_hash.each do |location, info|
        info.each do |key, team_info|
            if name == info[:team_name]
                if key == :players
                    team_info.each do |player, stats|
                        stats.each do |stat, val|
                            if stat == :number
                                player_num_array << val
                                end
                            end
                        end
                    end
                end
            end
        end
    player_num_array
end

def player_stats(name) #working
    stats = {}
    game_hash.each do |location, info|
        info.each do |key, team_data|
            if key == :players
                team_data.each do |player, stat|
                    if player == name
                        stats = stat
                        end
                    end
                end
            end
        end
        stats
end

def team_colors(team) #working
    color_array = []
    game_hash.each do |location, info|
        info.each do |key, team_info|
            if info[:team_name] == team
                color_array = info[:colors]
                end
            end
        end
    color_array
end

def team_names #working
    team_name_array = []
    game_hash.each do |location, info|
        info.each do |key, team_info|
            if key == :team_name
                team_name_array << info[:team_name]
                end
            end
        end
    team_name_array
end

def shoe_size(name) #working
    size = 0
    game_hash.each do |location, info|
        info.each do |key, team_info|
            if key == :players
                team_info.each do |player, stats|
                    if player == name
                        stats.each do |stat, val|
                            if stat == :shoe
                                size = val
                                end
                            end
                        end
                    end
                end
            end
        end
        size
end


def big_shoe_rebounds #working
    big_shoe_hash = {}
    game_hash.each do |location, info|
        info.each do |key, team_info|
            if key == :players
                team_info.each do |player, stat|
                    stat.each do |k, val|
                        if k == :shoe
                            big_shoe_hash.store(player, val) #iterate through to create a has of the players and shoe sizes
                            end
                        end
                    end
                end
            end
    
        end
    athlete = big_shoe_hash.max_by {|k,v| v } #find the max shoe size from our big_shoe_has
    player_stats(athlete[0])[:rebounds]  #and use our player stats to pull stats from game_hash using the :rebounds key
end

def most_points_scored
    ppg_hash = {}
    game_hash.each do |location, info|
        info.each do |key, team_info|
            if key == :players
                team_info.each do |player, stat|
                    stat.each do |k, val|
                        if k == :points
                            ppg_hash.store(player, val) #iterate through to create a hash of the players and points scored
                        end
                    end
                end
            end
        end
        
    end
    athlete = ppg_hash.max_by {|k,v| v } #find the highest scorer from our ppg_hash
    athlete[0] #since max_by returns an array with the key and value, we can use the 0 index to access only the key
end






