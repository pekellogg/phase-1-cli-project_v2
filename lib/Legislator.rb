class Legislator
    CHAMBERS = ["senate", "house"]
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

    def self.create_legislators
        CHAMBERS.each do |chamber|
            uri = APICall::BASE + "/117" + "/#{chamber}" + "/members.json"
            APICall.get_legislators(uri).each do |attrs|
                new(attrs) if attrs["in_office"] && (attrs["short_title"] == "Sen." || attrs["short_title"] == "Rep." )
            end
        end
    end

    def contact_card
        puts ""
        puts "#{self.title} #{self.first_name} #{self.last_name}"
        puts "#{self.office} | #{self.phone}"
        puts ""
    end

    def rep_name_title
        "#{self.first_name} #{self.last_name}, #{self.title}"
    end
end