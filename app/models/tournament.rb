class Tournament < ApplicationRecord
    has_many :decks

    validates :event_name, :event_date, :info, presence: true
    validates :finished, inclusion: { in: [true, false] }

    # Model Methods

    def self.sort_tournaments (sort, t) # Current sorting method for tournaments, can be replaced by scopes
        if sort == "Most Recent"
            t.sort {|a,b| b.created_at <=> a.created_at}
        elsif sort == "Least Recent"
            t.sort {|a,b| a.created_at <=> b.created_at}
        else 
            t.sort {|a,b| b.created_at <=> a.created_at}
        end 
    end

    # Note about next method
        # When a new deck object is created, it must belong to a tournament. If no tournament object
        # exists, then validations will not allow that deck object to be created. This method 
        # guarantees that a tournament object with an id of 1 exists to prevent validations errors, 
        # allowing users to create deck objects. This method doesn't have a purpose if the seed data,
        # that creates a tournament object with an id of 1, is used. Since there's no guarentee that
        # the seed data will be used, this method is still present.

    def self.make_first_tournament # Makes a tournament object to prevent an error that would come
            # up if no tournament objects have been created at the time of creating a deck
        if !Tournament.find_by(id: 1)
            t = Tournament.new(
                event_name: "Public Decks", 
                event_date: "NA", 
                finished: true, 
                info: "This is the tournament that all user created decks will default to."
                )
            t.save
        end 
    end 

end