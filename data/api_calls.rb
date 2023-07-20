require 'pry'

class APICall
    BASE = "https://api.propublica.org/congress/v1"
    PROPUBLICA = ENV['LEGISLATORS_KEY']

    # https://api.propublica.org/congress/v1/117/senate/members.json
    #usage: Legislator class-level for Legislator.all
    def self.get_legislators(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": PROPUBLICA})
        body = JSON.parse(response.body) if response.code == 200
        body["results"][0]["members"]
    end

    # https://api.propublica.org/congress/v1/117/house/members.json
    #usage: Vote class-level for Vote.all, past 30 days
    def self.get_votes(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": PROPUBLICA})
        body = JSON.parse(response.body) if response.code == 200
        body["results"]["votes"]
    end

    # https://api.propublica.org/congress/v1/both/votes/2023-06-19/2023-07-19.json
    #usage: vote instance-level positions
    def self.get_vote_positions(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": PROPUBLICA})
        body = JSON.parse(response.body) if response.code == 200
        body["results"]["votes"]["vote"]["positions"]
    end
end