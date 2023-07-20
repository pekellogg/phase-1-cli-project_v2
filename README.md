# JustCivicEngagement

This is a CLI Ruby application that allows users to find their WA representatives and voting information. _All legislators within are members of the U.S. 117th Congress. Votes are available from a rolling 30 day look-back period._

## Installation and Contributions

1. Request an API key from [Propublica's Data Store](https://www.propublica.org/datastore/api/propublica-congress-api).
2. Fork and clone this repository.
3. Create a .dotenv enviroment file to house your API key using below format. _Make sure to add this key to your .gitignore._

   ```bash
   legislators_key=[INSERT API KEY]
   ```

4. Install project dependencies.

   ```bash
   bundle install
   ```

5. Start CLI App and follow prompts.

   ```bash
   bin/run
   ```

Pull requests with constructive criticism welcomed.

### Resources

#### Propublica

The data in this app have been unmodified are provided by ProPublica.
Data may contain errors and omissions from time to time.

ProPublica Congress API [Docs](https://projects.propublica.org/api-docs/congress-api/)

V1 Congress [Endpoint](https://api.propublica.org/congress/v1)

#### License

"ProPublica Congress API" licensed under [Creative Commons](https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode) Attribution-NonCommercial-NoDerivs 3.0 United States

This application is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
