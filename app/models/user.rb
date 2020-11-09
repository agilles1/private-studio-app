class User < ActiveRecord::Base
    has_many :students, class_name: "User", foreign_key: "teacher_id"
    has_many :assignments, foreign_key: "student_id"
   
    belongs_to :teacher, class_name: "User", required: false
    has_many :assignments, through: :students, class_name: "User"

    has_secure_password
end
