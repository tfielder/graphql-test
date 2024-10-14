class User < ApplicationRecord

    has_secure_password

    has_many :sessions


    def self.visible?(context)
        !!context[:current_user]
    end
end
