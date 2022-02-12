class State
    STATES = ["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
    @@all = []
    def self.all
        @@all
    end

    attr_accessor :name, :legislators
    
    def initialize(name = nil)
        @name = name
        @legislators = Legislator.all.find_all{|rep|rep.state == self.name}
        self.class.all << self
    end

    def self.create_states
        STATES.each{|str|State.new(str)}
    end

    def self.locate(str)
        State.all.find{|state|state.name.casecmp?(str)}
    end

    def legislator_ids
        self.legislators.map{|rep|rep.id}
    end
end