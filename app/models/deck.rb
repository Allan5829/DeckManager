class Deck < ApplicationRecord
    has_many :user_decks
    has_many :users, through: :user_decks
    belongs_to :tournament
    has_many :cards
    accepts_nested_attributes_for :cards

    validates :title, presence: true

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

end