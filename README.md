FedLookup
This is a CLI Ruby application that allows you to look up local (state-based) representative contact and voting information. All legislators within are members of the U.S. 117th Congress. Votes are available from a 30 day look-back period.

Installation
Request an API key from <a href="https://www.propublica.org/datastore/api/propublica-congress-api">Propublica's Data Store</a>. (*Currently, keys are provisioned quickly.)
Fork and clone this repository to your machine.
Use command $ touch .env to create an enviroment file to house your API key. 
    legislators_key="<YOUR API KEY HERE>"
Use command $ bundle install to install dependencies.
Use command $ bin/run and follow command prompts.
Pull requests welcomed!

License
This application is available as open source under the terms of the <a href="https://opensource.org/licenses/MIT">MIT License</a>.

API Citation
The data in this app have been unmodified are provided by ProPublica.
ProPublica requires us to let you know that these data may contain errors and omissions from time to time.
'ProPublica Congress API' by ProPublica is licensed under <a href="https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode">Creative Commons Attribution-NonCommercial-NoDerivs 3.0 United States</a>.
URI: https://api.propublica.org/congress/v1

There's More ~
Full <a href="https://projects.propublica.org/api-docs/congress-api/">documentation</a> is available if you're curious about what the ProPublica Congress API offers beyond the scope of this project.

