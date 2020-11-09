class Teacher < ActiveRecord::Base
    has_many :students
    has_many :assignments, through: :students
    has_secure_password
end
