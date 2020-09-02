class User < ApplicationRecord
    has_many :user_decks
    has_many :decks, through: :user_decks

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_secure_password

end