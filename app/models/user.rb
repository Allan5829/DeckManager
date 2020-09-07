class User < ApplicationRecord
    has_many :user_decks
    has_many :decks, through: :user_decks

    validates :name, :email, presence: true, uniqueness: true
    has_secure_password

    def self.find_or_create_from_auth(auth)
        git_name = auth.info.nickname
        git_email = auth.info.email

        if user = User.find_by(name: git_name, email: git_email) 
            # Case 1- Nickname and email match account in database.
        elsif user = User.find_by(uid: auth.uid)
            # Case 2- User had to supply more information because validations didn't pass due to
            # same name/email as another account or github account doesn't have an email associated with
            # it so this uses the uid from github to identify existing users.
        else
            # Case 3- First time signing in with github and this grabs data to make a new account.
            user = User.new
            user.name = git_name
            user.email = git_email
            user.password = auth.credentials.token
            user.admin = false
            user.uid = auth.uid
        end 

        user
    end

end