require "bundler/setup"
require "dotenv/load"
require "date"
require_relative "../data/api_calls"
require_relative "../lib/Legislator"
require_relative "../lib/Vote"
require_relative "../lib/State"
require_relative "../lib/cli"

# load project deps
Bundler.require(:default, :development)

# init resources
Legislator.create_legislators
State.create_states
Vote.create_votes