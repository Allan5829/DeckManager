class Card < ApplicationRecord
    belongs_to :deck

    # Card Object Validations
    
    validates :pokemon, :trainer, :basic_energy, :special_energy, inclusion: { in: [true, false] }
    validate :one_card_type

    validate :quantity_per_type

    validates :name, presence: true
    validates :set_info, presence: true, 
        if: :pokemon?
        

    # Validation Methods Start

    def one_card_type
        card_type = 0
        card_type += 1 if self.pokemon
        card_type += 1 if self.trainer
        card_type += 1 if self.special_energy
        card_type += 1 if self.basic_energy

        if card_type > 1
            errors.add(:error, "can't be defined as two+ types of cards")
        elsif card_type < 1
            errors.add(:error, "must be defined as a type of card")
        end 
    end 

    def quantity_per_type
        if self.pokemon || self.trainer || self.special_energy
            if self.count < 1 || self.count > 4
                errors.add(:error, "this type of card must have a quantity of 1-4")
            end 
        elsif self.basic_energy
            if self.count < 1 || self.count > 60
                errors.add(:error, "basic energy must have a valid quantity")
            end
        end
    end 

end