class Vote
    @@all = []
    def self.all
        @@all
    end

    def initialize(attributes)
        attributes.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        self.class.all << self
    end

    def self.create_votes
        APICall.get_votes(APICall::BASE + "/both/votes/#{(Date.today - 30).to_s}/#{Date.today.to_s}.json").each{|vote|new(vote)}
    end

    def display
        puts "Date: #{self.date}"
        if self.chamber.casecmp?("house") && self.bill != {} && self.vote_type != "QUORUM"
            puts "Bill number: #{self.bill["number"]}"
            puts "Bill Title: #{self.bill["title"]}"
            puts "Latest action: #{self.bill["latest_action"]}"
        end
        puts "Description: #{self.description}"
        puts "Vote type: #{self.vote_type}"
        puts "Question: #{self.question}"
        puts "Result: #{self.result}"
        puts "Yes: #{self.total["yes"]}" + "  " + "No: #{self.total["no"]}" + "  " + "Not voting: #{self.total["not_voting"]}" if self.total["not_voting"] > 0
    end

    def state_positions(state)
        positions = APICall.get_vote_positions(self.vote_uri)
        positions.find_all{|position|state.legislator_ids.include?(position["member_id"])}
    end

    def display_with_positions(state)
        positions_by_state = self.state_positions(state)
        puts ""
        puts ""
        puts ""
        self.display
        puts "Representative positions:"
        puts "-------------------------"
        positions_by_state.each{|position|puts "#{position["name"]}: #{position["vote_position"]}"}
        puts ""
        puts ""
        puts ""
    end
end