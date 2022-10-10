# Exoplanet Indexer

Welcome to Exoplanet Indexer, the new app to track all of the latest discoveries in astronomy.  This app provides an easy way to add planets and catalog entire star systems, including key metrics for the planet and its star.  In the interest of collaboration, all users can view all astronomical data in the system, but secure user accounts ensure that your own data stays the way you want it.  This tool uses collaboration to create an important index of all new discoveries.  

## Installation

To use this app, just clone this [repo] https://github.com/christopherdent/dent-exoplanet-sinatra.git.  Ensure you are using Ruby 2.7.3.  

And then:

$ `bundle install`
$ `rake db:migrate`
$ `rake db:seed`

Or view the live app at http://polar-lake-91544.herokuapp.com/.  Login as a guest (username: guest, password: guest).

## Usage

To deploy the app locally please run `rake db:migrate` and then `shotgun` in your the terminal.  Then navigate to 'localhost:9393'.  

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/christopherdent/dent-exoplanet-sinatra. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
