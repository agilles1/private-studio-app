class Student < ActiveRecord::Base
    belongs_to :teacher
    has_many :assignments
    has_secure_password
end
