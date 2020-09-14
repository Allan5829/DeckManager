class Deck < ApplicationRecord
    has_many :user_decks
    has_many :users, through: :user_decks
    belongs_to :tournament
    has_many :cards

    accepts_nested_attributes_for :cards

    # removes cards that have no name and count so blank cards aren't saved
    before_validation :remove_empty_cards 

    # Deck Object Validations
    validates :title, :tournament_placement, presence: true
    validates :shared, inclusion: { in: [true, false] }
    validate :deck_count # deck must have 60 cards
    validate :no_duplicates # can't create 2 cards with the same information in certain cases
    validate :pokemon_count # can't have more than 4 pokemon with the same name

    # Model Methods Start

    @rows = 20
    @edit_rows = 1

    def self.row_increase(action)
        if action == "new"
            @rows += 1
        elsif action == "edit"
            @edit_rows += 1 
        end 
    end

    def self.row_decrease(action)
        if action == "new"
            @rows -= 1
        elsif action == "edit"
            @edit_rows -= 1 
        end 
    end

    def self.row(action)
        if action == "new"
            @rows 
        elsif action == "edit"
            
            @edit_rows 
        end 
    end

    def get_card_counts
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

    def admin_deck_delete 
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

    def self.sort_decks (sort, d)
        if sort == "Number of Users"
            d.sort {|a,b| b.users.count <=> a.users.count}
        elsif sort == "Newest Created"
            d.sort {|a,b| b.created_at <=> a.created_at}
        elsif sort == "Oldest Created"
            d.sort {|a,b| a.created_at <=> b.created_at}
        else 
            d.sort {|a,b| b.created_at <=> a.created_at}
        end
    end 

    # Validation Methods Start

    def deck_count
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

    def no_duplicates
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

    def pokemon_count # Case is when the number of pokemon with the same name is more than 4
        card_array = []

        self.cards.each do |card|
            card.count.times { card_array << card.name } if card.pokemon
            if card_array.count(card.name) > 4
                errors.add(:deck, "can't play more than 4 pokemon with the same name")
            end 
        end
    end 

    private

    def remove_empty_cards
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