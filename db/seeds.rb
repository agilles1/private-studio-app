sophie ={name: "Sophie", email: "Imadog@aol.com", password: "ilovenaps", phone_number: "555-652-5166"}
kenai = {name: "Kenai", email: "ballislyfe@aol.com", password: "ball", phone_number: "555-456-5166"}
michael = {name: "Michael", email: "drumzrule@yahoo.com", password: "biden2020", phone_number: "3333333333"}
tim = {name: "Tim", email: "dewtit@me.org", password: "trumpetisfun", phone_number: "555-652-5000"}
todd = {name: "Todd", email: "num1dad@you.net", password: "trumpetisfun", phone_number: "555-652-4500"}
teacher_todd = User.create(todd)
teacher_tim =  User.create(tim)
student_sophie = User.new(sophie)
student_sophie.teacher = teacher_todd
student_sophie.save
student_kenai = User.new(kenai)
student_kenai.teacher = teacher_todd
student_kenai.save
student_michael = User.new(michael)
student_michael.teacher = teacher_tim
student_michael.save

i=1
until i==10 do
    assignment = "This is assignment number #{i}."
    new = Assignment.new(content: assignment)
    new.student = student_kenai
    new.teacher = student_kenai.teacher
    new.save
    i+=1
end

i=1
until i==6 do
    assignment = "This is assignment number #{i}."
    new = Assignment.new(content: assignment)
    new.student = student_michael
    new.teacher = student_michael.teacher
    new.save
    i+=1
end

i=1
until i==15 do
    assignment = "This is assignment number #{i}."
    new = Assignment.new(content: assignment)
    new.student = student_sophie
    new.teacher = student_sophie.teacher
    new.save
    i+=1
end