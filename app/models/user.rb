class User < ApplicationRecord
    validates :username, presence: true, length:{minimum: 2}
    validates :email,  presence: true
    validates :password, presence: true, length:{within: 3..10}

end
