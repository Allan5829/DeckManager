class Deck < ApplicationRecord
    has_many :user_decks
    has_many :users, through: :user_decks
    belongs_to :tournament
    has_many :cards
    accepts_nested_attributes_for :cards

    #removes cards that have no name so cards aren't created with a blank name
    before_validation :remove_empty_cards 

    #deck object validations
    validates :title, presence: true
    validates :shared, inclusion: { in: [true, false] }

    #card object validations
    validate :deck_count

    def deck_count
        deck_count = 0
        self.cards.each do |card|
            deck_count += card.count
        end 
        if deck_count < 60
            errors.add(:deck, "has less then 60 cards")
        elsif deck_count > 60
            errors.add(:deck, "has more then 60 cards")
        end 
    end






    @rows = 2

    def self.row_increase
        @rows += 1
    end

    def self.row_decrease
        @rows -= 1
    end

    def self.row
        @rows
    end

    
    


    private

    def remove_empty_cards
        blank_card = []
        self.cards.each do |card|
            if !card.name.present? && !card.count.present?
                blank_card << card 
            end 
        end 
        self.cards = cards - blank_card

        true
    end

end