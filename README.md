# DeckManager

This application allows users to create/edit decks and allows admins to create/edit tournaments that show the results of a competitive event. At the time of creation, this application only supports decks made for the Pokemon Trading Card Game because that is the card game the creator was most invested in at that point. Each deck follows the basic rules that a deck would need to follow in order to be played at a competitive event.

## Installation

To use this application, clone the repository and run

    $ bundle install

## Usage

Run migrations and if you would like to have example data to play around with there is seed data included.

    $ rake db:migrate
    $ rake db:seed
    $ rails server 

## How to use?

Any visitor is able to view posted tournaments, public decks and decklists for those decks. Visitors can create accounts or login with Github if they would like.

Any user is able to: create a new deck, edit a deck they created, and save public decks or decks that are recorded in any posted tournament.

An admin is responsible for: creating new tournaments, creating decks for those respective tournaments, and deleting inappropriate decks made by users.

## How to improve?

The biggest thing that can be improved, back-end wise, is during the deck creation process. Currently, users must input each card and set name by hand which can easily lead to bad data due to many factors. An ideal situation would be one where a user inputs the name of the card and a database returns a list of cards that match the search text. The application would take care of making sure the card name and set are correct. However, that was not the priority of this application and could be something the creator comes back to.

Front-end also needs a lot of work because the creator's priority was back-end functionality.

Application can be expanded to other Trading Card Games.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'Allan5829'/DeckManager. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The application is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
