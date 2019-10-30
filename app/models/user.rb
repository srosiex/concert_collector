class User < ActiveRecord::Base
    has_secure_password

    validates :first_name, presence: true
    validates :username, presence: true, uniqueness: true
    has_many :events
end
