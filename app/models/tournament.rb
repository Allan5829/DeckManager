class Tournament < ApplicationRecord
    has_many :decks

    validates :event_name, :event_date, :info, presence: true
    validates :finished, inclusion: { in: [true, false] }

    # Model Methods

    def self.sort_tournaments (sort, t)
        if sort == "Most Recent"
            t.sort {|a,b| b.created_at <=> a.created_at}
        elsif sort == "Least Recent"
            t.sort {|a,b| a.created_at <=> b.created_at}
        else 
            t.sort {|a,b| b.created_at <=> a.created_at}
        end 
    end

#when a new Deck is created it has to be associated to a Tournament Object and this method creates the 
    #first tournament just in case the first one doesn't exist but if you use the seed data you can
    #disreguard this or comment out this method in decks_controller.rb
    def self.make_first_tournament 
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