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
    