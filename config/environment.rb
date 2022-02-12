require "bundler/setup"
require "date"
Bundler.require(:default, :development)

Dotenv.load

require_relative "../data/api_calls"
require_relative "../lib/legislator"
require_relative "../lib/vote"
require_relative "../lib/state"
require_relative "../lib/cli"

Legislator.create_legislators
State.create_states
Vote.create_votes