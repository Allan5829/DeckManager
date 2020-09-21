class Deck < ApplicationRecord
    has_many :user_decks
    has_many :users, through: :user_decks
    belongs_to :tournament
    has_many :cards

    accepts_nested_attributes_for :cards

    # Before Validations
    before_validation :remove_empty_cards 

    # Deck Object Validations
    validates :title, :tournament_placement, presence: true
    validates :shared, inclusion: { in: [true, false] }
    validate :deck_count 
    validate :no_duplicates 
    validate :pokemon_count 

    # Scopes
    scope :public_deck, -> { where(shared: true) }
    scope :newest_created, -> { public_deck.order(created_at: :desc) }
    scope :oldest_created, -> { public_deck.order(created_at: :asc) }

    # Could replace sort with order, but to do so would require more code and be inefficent
    scope :most_users, -> { public_deck.sort {|a,b| b.users.count <=> a.users.count} }

    # Model Methods Start

    @rows = 20
    @edit_rows = 1

    def self.row_increase(action) # Changes how many "child" objects are created
        if action == "new"
            @rows += 1
        elsif action == "edit"
            @edit_rows += 1 
        end 
    end

    def self.row_decrease(action) # Changes how many "child" objects are created
        if action == "new"
            @rows -= 1
        elsif action == "edit"
            @edit_rows -= 1 
        end 
    end

    def self.row(action) # Determines how many "child" objects are created
        if action == "new"
            @rows 
        elsif action == "edit"
            @edit_rows 
        end 
    end

    def get_card_counts # Used in decks_controller.rb for show in order to diaplay useful information
        array = []

        count = 0
        self.cards.each do |card|
            card.count.times { count += 1 } if card.pokemon
        end
        array << count

        count = 0
        self.cards.each do |card|
            card.count.times { count += 1 } if card.trainer
        end
        array << count

        count = 0
        self.cards.each do |card|
            card.count.times { count += 1 } if card.special_energy || card.basic_energy
        end
        array << count
    end 

    def admin_deck_delete # Deck destroy method
        user_deck = UserDeck.where(deck_id: self.id)

        user_deck.each do |ud|
            ud.destroy
        end

        self.cards.each do |card|
            card.destroy
        end 

        self.destroy
        
        return true
    end 

    # Validation Methods Start

    def deck_count # Decks must have 60 cards exactly
        deck_count = 0

        self.cards.each do |card|
            deck_count += card.count unless card.count.nil?
        end 

        if deck_count < 60
            errors.add(:deck, "can't have less than 60 cards")
        elsif deck_count > 60
            errors.add(:deck, "can't have more than 60 cards")
        end 
    end

    def no_duplicates # Makes sure users can't create 2 cards with the same information in certain cases
        card_array = []

        self.cards.each do |card|
            # Case 1: Pokemon can have same name if different set info
            card_array << card.set_info if card.pokemon
            # Case 2: All other types of cards can't have the same name
            card_array << card.name if card.trainer
            card_array << card.name if card.basic_energy
            card_array << card.name if card.special_energy
        end

        if card_array.uniq.length != card_array.length
            errors.add(:deck, "can't have the same card info in different rows")
        end 
    end 

    def pokemon_count # Makes sure users can't create a deck that uses more than 4 pokemon with the 
            # same name
        card_array = []

        self.cards.each do |card|
            card.count.times { card_array << card.name } if card.pokemon
            if card_array.count(card.name) > 4
                errors.add(:deck, "can't play more than 4 pokemon with the same name")
            end 
        end
    end 

    private

    def remove_empty_cards # Removes card objects that have no name and/or count so blank cards aren't 
            # saved/get caught by validations
        blank_card = []

        self.cards.each do |card|
            if !card.name.present? && ( !card.count.present? || card.count == 0)
                blank_card << card 
            end 
        end 

        self.cards = cards - blank_card
        true
    end

end