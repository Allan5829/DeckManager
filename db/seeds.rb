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
    tournament_placement: 0,
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
    tournament_placement: 0,
    cards_attributes:[ 

        { pokemon: false, trainer: false, basic_energy: true, special_energy: false, 
        name: ':p', count: 60, set_info: ':p' }

    ])

UserDeck.create(:user_id => 1, :deck_id => 2)
UserDeck.create(:user_id => 2, :deck_id => 2)

tournament2 = Tournament.create(
    event_name: 'League Challenge', 
    event_date: 'September 12, 2020', 
    finished: false, 
    info: 'Standard Format, 16 players'
    )

deck3 = Deck.create(
    title: 'Charizard Deck', 
    description: '', 
    shared: false, 
    player_name: 'Ash Ketchum', 
    tournament_id: 2,
    tournament_placement: 4,
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

deck4 = Deck.create(
    title: 'Blastoise Deck', 
    description: '', 
    shared: false, 
    player_name: 'Gary Oak', 
    tournament_id: 2,
    tournament_placement: 2,
    cards_attributes:[ 
         
        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Squirtle', count: 4, set_info: 'swsh 26' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Wartortle', count: 4, set_info: 'swsh 27' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Blastoise', count: 4, set_info: 'swsh 28' },

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
        name: 'Water Energy', count: 20, set_info: '' }, 

        { pokemon: false, trainer: false, basic_energy: false, special_energy: true, 
        name: 'Splash Energy', count: 4, set_info: '' }

    ])

deck5 = Deck.create(
    title: 'Water Deck', 
    description: '', 
    shared: false, 
    player_name: 'Misty', 
    tournament_id: 2,
    tournament_placement: 3,
    cards_attributes:[ 
         
        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Psyduck', count: 4, set_info: 'swsh 29' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Horsea', count: 4, set_info: 'swsh 30' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Starmie', count: 4, set_info: 'swsh 31' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Gyarados', count: 4, set_info: 'swsh 32' },

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
        name: 'Water Energy', count: 20, set_info: '' }, 

        { pokemon: false, trainer: false, basic_energy: false, special_energy: true, 
        name: 'Splash Energy', count: 4, set_info: '' }

    ])

deck6 = Deck.create(
    title: 'Rock Deck', 
    description: '', 
    shared: false, 
    player_name: 'Brock', 
    tournament_id: 2,
    tournament_placement: 1,
    cards_attributes:[ 
         
        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Geodude', count: 4, set_info: 'swsh 33' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Onix', count: 4, set_info: 'swsh 34' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Steelix', count: 4, set_info: 'swsh 35' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Aerodactyl', count: 4, set_info: 'swsh 36' },

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
        name: 'Fighting Energy', count: 20, set_info: '' }, 

        { pokemon: false, trainer: false, basic_energy: false, special_energy: true, 
        name: 'Strong Energy', count: 4, set_info: '' }

    ])

UserDeck.create(:user_id => 3, :deck_id => 3)
UserDeck.create(:user_id => 3, :deck_id => 4)
UserDeck.create(:user_id => 3, :deck_id => 5)
UserDeck.create(:user_id => 3, :deck_id => 6)