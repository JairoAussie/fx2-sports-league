require_relative("./seed.rb")
require "tty-prompt"
#definition of global variables
$league = seed
$prompt = TTY::Prompt.new
#this method shows a menu and returns the selected option
def select_option
    answer = $prompt.select("What's your option?", ["Ladder", "Team's info", "Play game","Train" ,"Exit"])
    return answer
end
#Method that displays list of teams and we select a team
def select_team
    team = $prompt.select("Select your team", $league.print_teams)
    return team
end

def select_game_mode
    mode = $prompt.select("What game mode do you want to play", ["Manual", "Simulated"])
    return mode
end

def play_game(home, away, mode)
    puts "Game between #{home} and #{away} in #{home.stadium}"
    if mode == "Manual"
        score_home = $prompt.ask("#{home} score: ", convert: :integer)
        score_away = $prompt.ask("#{away} score: ", convert: :integer)
    else
        score_home = rand(60..100) +home.stamina + home.mood + 5
        
        score_away = rand(60..100) + away.stamina + away.mood
        puts "Simulating..."
        sleep(5)
    end
    puts "#{home} #{score_home} - #{away} #{score_away}"
    if score_home > score_away
        home.win
        away.lose
    else
        away.win
        home.lose
    end
end

system "clear"
puts "Welcome to #{$league}, the best league in the world"
option = ""
while option != "Exit"
    #invokes the menu and stores the option in the variable
    option = select_option
    #case statement to handle the options of the menu
    case option
        when "Ladder"
            $league.print_ladder
        when "Team's info"
            team = select_team
            team.full_info
        when "Play game"
            home = select_team
            away = select_team
            mode = select_game_mode
            play_game(home, away, mode)
            #puts "Play game"
        when "Train"
            team = select_team
            team.train
        else
            puts "See you next time..."
            next
    end
    print "Press Enter key to continue..."
    gets
    system "clear"
end