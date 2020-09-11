user1 = User.create(name: 'Allan5829', email: 'email@email.com', password: 'password', admin: false)
user2 = User.create(name: 'name', email: 'email', password: 'password', admin: false)
admin1 = User.create(name: 'Allan', email: 'allan@gmail.com', password: 'password', admin: true)

tournament1 = Tournament.create(
    event_name: 'Public Decks', 
    event_date: 'NA', 
    finished: true, 
    info: 'This is the tournament that all user created decks will default to.'
    )

deck1 = Deck.create(
    title: 'Test Deck 1', 
    description: 'description for test deck 1', 
    shared: true, 
    player_name: 'Allan5829', 
    tournament_id: 1,
    cards_attributes:[ 
         
        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Charmander', count: 4, set_info: 'swsh 20' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Charmeleon', count: 4, set_info: 'swsh 21' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Charizard', count: 4, set_info: 'swsh 22' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Dedenne GX', count: 4, set_info: 'brb 40' },

        { pokemon: false, trainer: true, basic_energy: false, special_energy: false, 
        name: 'Professor Oak', count: 4, set_info: '' },

        { pokemon: false, trainer: true, basic_energy: false, special_energy: false, 
        name: 'Professor Birch', count: 4, set_info: '' },

        { pokemon: false, trainer: true, basic_energy: false, special_energy: false, 
        name: 'Professor Elm', count: 4, set_info: ''  },

        { pokemon: false, trainer: true, basic_energy: false, special_energy: false, 
        name: 'Professor Rowan', count: 4, set_info: '' },

        { pokemon: false, trainer: true, basic_energy: false, special_energy: false, 
        name: 'Professor Juniper', count: 4, set_info: '' }, 

        { pokemon: false, trainer: false, basic_energy: true, special_energy: false, 
        name: 'Fire Energy', count: 20, set_info: '' }, 

        { pokemon: false, trainer: false, basic_energy: false, special_energy: true, 
        name: 'Heat Energy', count: 4, set_info: '' }

    ])

UserDeck.create(:user_id => 1, :deck_id => 1) 

deck2 = Deck.create(
    title: 'ALL ENERGY AHAHAHA', 
    description: 'example deck to showcase an admin deleting a deck', 
    shared: true, 
    player_name: 'name', 
    tournament_id: 1,
    cards_attributes:[ 

        { pokemon: false, trainer: false, basic_energy: true, special_energy: false, 
        name: ':p', count: 60, set_info: ':p' }

    ])

UserDeck.create(:user_id => 1, :deck_id => 2)
UserDeck.create(:user_id => 2, :deck_id => 2)