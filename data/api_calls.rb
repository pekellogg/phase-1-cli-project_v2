class APICall
    BASE = "https://api.propublica.org/congress/v1"
    PROPUBLICA = ENV.fetch("legislators_key")

    #usage: Legislator class-level for Legislator.all
    def self.get_legislators(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": PROPUBLICA})
        body = JSON.parse(response.body) if response.code == 200
        body["results"][0]["members"]
    end

    #usage: Vote class-level for Vote.all, past 30 days
    def self.get_votes(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": PROPUBLICA})
        body = JSON.parse(response.body) if response.code == 200
        body["results"]["votes"]
    end

    #usage: vote instance-level positions
    def self.get_vote_positions(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": PROPUBLICA})
        body = JSON.parse(response.body) if response.code == 200
        body["results"]["votes"]["vote"]["positions"]
    end
end