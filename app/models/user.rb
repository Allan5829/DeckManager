class User < ApplicationRecord
    has_many :user_decks
    has_many :decks, through: :user_decks

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_secure_password

    def self.find_or_create_from_auth(auth)
        git_name = auth.info.nickname
        git_email = auth.info.email

        if user = User.find_by(name: git_name, email: git_email)
            user.save
        elsif user = User.find_by(name: git_name)
            user = user.try(:authenticate, auth.credentials.token)
            #binding.pry
        else
            user = User.new
            user.name = git_name
            user.email = git_email
            user.password = auth.credentials.token
            user.admin = false
        end 

        user
    end

end