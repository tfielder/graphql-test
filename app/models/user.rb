class User < ApplicationRecord

    has_secure_password

    has_many :sessions


    def self.visible?(context)
        !!context[:current_user] #for user who is logged in
    end
end
