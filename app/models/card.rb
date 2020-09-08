class Card < ApplicationRecord
    belongs_to :deck

    # Card Object Validations
    
    validates :name, presence: true
    validates :pokemon, :trainer, :basic_energy, :special_energy, inclusion: { in: [true, false] }
    validates :count, inclusion: { in: [1..4], 
        message: "you can only play with 1-4 copies of the same card in a deck, unless it's basic energy" },
        if: :not_basic_energy?
    validates :count, inclusion: { in: [1..60], 
        message: "energy must be a valid number of cards" },
        if: :basic_energy?

    # Validation Methods Start

    def not_basic_energy?
        !self.basic_energy
    end  

end