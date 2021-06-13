class User < ActiveRecord::Base
    has_many :students, class_name: "User", foreign_key: "teacher_id"
    belongs_to :teacher, class_name: "User", required: false
    has_many :assignments, foreign_key: "student_id"
    has_many :student_assignments, through: :students, source: :assignments, foreign_key: "teacher_id"

    has_secure_password

    def teacher? #returns false is a User has a teacher_id
        true unless self.teacher_id && self.teacher_id > 0
    end

end
