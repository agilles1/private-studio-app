Concept:
Private Music Student Management 

Teachers can:
    -sign-up/login/logout
    -view a list of all their students
    -create lesson notes/assignments for their students
    -ADDITIONAL GOAL:
        -some form of payment tracking? 
        -lesson booking?
            -Use Google Cal API?

Students can:
    -sign-up/login/logout
    -view their lesson noted for each lesson
    -ADDITIONAL GOAL:
        -message their teacher with questions

Note has:
    -Lesson_Date
    -Content
    -can be editted 
    -Student_id
    -Teacher_id
    -Belongs to:   
        -Student (read only) 
        -Teacher (CRUD)
    
TO DO:
    -Teacher
        [X] create/edit/delete new user function
        [X] student assignment view
        [X] create/edit/delete new assignment
        [X] add if_logged_in? authentication
        [ ] add student to "roster" (Prints a list of Students without teacher_id)
        [X] do not create if already exhists?

    -Student
        [X] CRUD account functions
            -select their teacher with radio button
        [ ] assignment read view

    -Assignment
        [X] Limit CUD function to teacher

            

