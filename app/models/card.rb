class Card < ApplicationRecord
    belongs_to :deck

    #validate :duplicate_name
    validates :basic_energy, inclusion: { in: [true, false] }

    validates :count, inclusion: { in: [1, 2, 3, 4], 
        message: ", you can only play with 1-4 copies of the same card in a deck, unless it's basic energy" },
        if: :not_basic_energy?

    def not_basic_energy?
        !self.basic_energy
    end 

    def duplicate
    end 

end