user1 = User.create(name: 'john', email: 'john@email.com', password: 'password', admin: false)
user2 = User.create(name: 'Mr Troll', email: 'email', password: 'password', admin: false)
admin3 = User.create(name: 'Allan', email: 'allan@gmail.com', password: 'password', admin: true)
user4 = User.create(name: 'frank', email: 'frank@email.com', password: 'password', admin: false)
user5 = User.create(name: 'ben', email: 'ben@email.com', password: 'password', admin: false)
user6 = User.create(name: 'nate', email: 'nate@email.com', password: 'password', admin: false)
user7 = User.create(name: 'otto', email: 'otto@email.com', password: 'password', admin: false)

tournament1 = Tournament.create(
    event_name: 'Public Decks', 
    event_date: 'NA', 
    finished: true, 
    info: 'This is the tournament that all user created decks will default to.'
    )

deck1 = Deck.create(
    title: 'Test Deck 1',  
    shared: true, 
    player_name: 'john', 
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

UserDeck.create(:user_id => 1, :deck_id => 1, :notes => "first practice deck") 
UserDeck.create(:user_id => 4, :deck_id => 1, :notes => "copied deck")
UserDeck.create(:user_id => 7, :deck_id => 1, :notes => "copied deck")

deck2 = Deck.create(
    title: 'ALL ENERGY AHAHAHA', 
    shared: true, 
    player_name: 'Mr Troll', 
    tournament_id: 1,
    tournament_placement: 0,
    cards_attributes:[ 

        { pokemon: false, trainer: false, basic_energy: true, special_energy: false, 
        name: ':p', count: 60, set_info: ':p' }

    ])

UserDeck.create(:user_id => 1, :deck_id => 2, :notes => "")
UserDeck.create(:user_id => 2, :deck_id => 2, :notes => "these are troll notes")

tournament2 = Tournament.create(
    event_name: 'League Challenge', 
    event_date: 'September 12, 2020', 
    finished: true, 
    info: 'Standard Format, 16 players'
    )

deck3 = Deck.create(
    title: 'Charizard Deck', 
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

UserDeck.create(:user_id => 3, :deck_id => 3, :notes => "charizard deck")
UserDeck.create(:user_id => 3, :deck_id => 4, :notes => "blastoise deck")
UserDeck.create(:user_id => 3, :deck_id => 5, :notes => "water deck")
UserDeck.create(:user_id => 3, :deck_id => 6, :notes => "rock deck")

tournament3 = Tournament.create(
    event_name: 'League Cup', 
    event_date: 'September 13, 2020', 
    finished: false, 
    info: 'Standard Format, 41 players'
    )

deck7 = Deck.create(
    title: 'Welder Mew3', 
    shared: false, 
    player_name: 'Stephane', 
    tournament_id: 3,
    tournament_placement: 1,
    cards_attributes:[ 
         
        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Mewtwo & Mew GX', count: 4, set_info: 'unm 30' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Victini V', count: 4, set_info: 'swsh 21' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Charizard GX', count: 4, set_info: 'swsh 22' },

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
        name: 'Weakness Guard Energy', count: 4, set_info: '' }

    ])

deck8 = Deck.create(
    title: 'ADP Zacian', 
    shared: false, 
    player_name: 'Zackary', 
    tournament_id: 3,
    tournament_placement: 3,
    cards_attributes:[ 
         
        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Arceus Dialga & Palkia GX', count: 4, set_info: 'swsh 26' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Zacian V', count: 4, set_info: 'swsh 27' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Crobat V', count: 4, set_info: 'swsh 28' },

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
        name: 'Shield Energy', count: 4, set_info: '' }

    ])

deck9 = Deck.create(
    title: 'Eternatus', 
    shared: false, 
    player_name: 'Charlie', 
    tournament_id: 3,
    tournament_placement: 4,
    cards_attributes:[ 
         
        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Eternatus V', count: 4, set_info: 'swsh 29' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Eternatus VMax', count: 4, set_info: 'swsh 30' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Crobat V', count: 4, set_info: 'swsh 31' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Hoopa', count: 4, set_info: 'swsh 32' },

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
        name: 'Dark Energy', count: 20, set_info: '' }, 

        { pokemon: false, trainer: false, basic_energy: false, special_energy: true, 
        name: 'Bad Energy', count: 4, set_info: '' }

    ])

deck10 = Deck.create(
    title: 'Deci Goons', 
    shared: false, 
    player_name: 'Caleb', 
    tournament_id: 3,
    tournament_placement: 2,
    cards_attributes:[ 
         
        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Rowlet', count: 4, set_info: 'swsh 33' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Decidueye', count: 4, set_info: 'swsh 34' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Zigzagoon', count: 4, set_info: 'swsh 35' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Obstagoon', count: 4, set_info: 'swsh 36' },

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
        name: 'Grass Energy', count: 20, set_info: '' }, 

        { pokemon: false, trainer: false, basic_energy: false, special_energy: true, 
        name: 'Counter Energy', count: 4, set_info: '' }

    ])

UserDeck.create(:user_id => 3, :deck_id => 7, :notes => "welder deck")
UserDeck.create(:user_id => 3, :deck_id => 8, :notes => "adpz")
UserDeck.create(:user_id => 3, :deck_id => 9, :notes => "dark")
UserDeck.create(:user_id => 3, :deck_id => 10, :notes => "single prize")

deck11 = Deck.create(
    title: 'Mew3', 
    shared: true, 
    player_name: 'otto', 
    tournament_id: 1,
    tournament_placement: 0,
    cards_attributes:[ 
         
        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Mewtwo & Mew GX', count: 4, set_info: 'unm 30' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Victini', count: 4, set_info: 'swsh 21' },

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
        name: 'Weakness Guard Energy', count: 4, set_info: '' }

    ])

UserDeck.create(:user_id => 7, :deck_id => 11, :notes => "mew3")
UserDeck.create(:user_id => 6, :deck_id => 11, :notes => "welder mew3")
UserDeck.create(:user_id => 5, :deck_id => 11, :notes => "psychic")
UserDeck.create(:user_id => 4, :deck_id => 11, :notes => "fire")

deck12 = Deck.create(
    title: 'ADPZ', 
    shared: true, 
    player_name: 'nate', 
    tournament_id: 1,
    tournament_placement: 0,
    cards_attributes:[ 
         
        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Arceus Dialga & Palkia GX', count: 4, set_info: 'swsh 26' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
            name: 'Zacian V', count: 4, set_info: 'swsh 27' },

        { pokemon: true, trainer: false, basic_energy: false, special_energy: false, 
        name: 'Crobat V', count: 4, set_info: 'swsh 28' },

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
        name: 'Shield Energy', count: 4, set_info: '' }

    ])



