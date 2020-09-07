class Deck < ApplicationRecord
    has_many :user_decks
    has_many :users, through: :user_decks
    belongs_to :tournament
    has_many :cards

    accepts_nested_attributes_for :cards

    # removes cards that have no name and count so blank cards aren't saved
    before_validation :remove_empty_cards 

    # Deck Object Validations
    validates :title, presence: true
    validates :shared, inclusion: { in: [true, false] }
    validate :deck_count # deck must have 60 cards
    validate :no_duplicate # can't create 2 cards with the same name

    #Model Methods Start

    @rows = 20

    def self.row_increase
        @rows += 1
    end

    def self.row_decrease
        @rows -= 1
    end

    def self.row
        @rows
    end

    # Validation Methods Start

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

    def no_duplicate
        card_array = []

        self.cards.each do |card|
            card_array << card.name
        end

        if card_array.uniq.length != card_array.length
            errors.add(:deck, "can't have the same card in different rows")
        end 
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