class Tournament < ApplicationRecord
    has_many :decks

    validates :event_name, :event_date, presence: true, uniqueness: true
    validates :finished, inclusion: { in: [true, false] }
    validates :info, presence: true

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