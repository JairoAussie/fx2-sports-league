class League

    def initialize (name, sport, description, teams)
        @name = name
        @sport = sport
        @description = description
        @teams = teams
    end

    def to_s
        return "#{@name}: #{@description}"
    end

    def print_teams
        @teams.each do |team|
            team
        end
    end

    def print_ladder
        puts "Team \t W \t L"
        sorted_array = @teams.sort_by{|team| team.wins}.reverse
        sorted_array.each do |team|
            team.print_team_table_view
        end
    end
end

