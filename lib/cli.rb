class Cli
    def self.start
        welcome
        play
    end

    def self.play
        selection = 0
        while selection < 5
            menu
            prompt
            selection = case decision
            when 1
                legislators
            when 2
                votes
            when 3
                works_cited
            when 4
                bye
            end
            play
        end
    end

    def self.welcome
        puts "Hello, citizen!"
        puts "Welcome to FedLookup, an app for voters to find the representatives in their state."
        puts ""
        puts ""
    end

    def self.menu
        puts "1 - Show representatives"
        puts "2 - Representative voting information"
        puts "3 - About the data in this app"
        puts "4 - Exit"
    end

    def self.prompt
        puts ""
        puts ""
        puts "What next? Please select by number."
        puts ""
        puts ""
    end

    def self.decision
        gets.strip.to_i
    end

    def self.state
        puts ""
        puts ""
        puts "Which state are you registered to vote in?"
        puts "For example, Washington state voters would type 'WA'."
        gets.strip
    end

    def self.legislators
        user_state = Cli.state
        if state = State.locate(user_state)
            puts "In the state of #{state.name}, your representatives are..."
            state.legislators.each{|i|i.contact_card}
        else
            puts "I didn't understand that."
            puts "Please try again with your state's two-letter abbreviation."
            legislators
        end
    end

    def self.votes
        puts ""
        puts ""
        user_state = Cli.state
        if state = State.locate(user_state)
            Vote.all.each{|v|v.display_with_positions(state)}

        else
            puts "I didn't understand that."
            puts "Please try again with your state's two-letter abbreviation."
            votes
        end
    end

    def self.works_cited
        puts ""
        puts ""
        puts "The data in this app have been unmodified are provided by ProPublica."
        puts "ProPublica requires us to let you know that these data may contain errors and omissions from time to time."
        puts ""
        puts ""
        puts "'ProPublica Congress API' by ProPublica is licensed under Creative Commons Attribution-NonCommercial-NoDerivs 3.0 United States."
        puts "Documentation available at: https://projects.propublica.org/api-docs/congress-api/"
        puts "URI: https://api.propublica.org/congress/v1"
        puts "View additional licensing information at https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode"
        puts ""
        puts ""
    end

    def self.bye
        puts "Thanks for using FedLookup!"
        exit(0)
    end
end