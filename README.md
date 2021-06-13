
<h1 align="center">MyStudio</h1>

<div align="center">
  MyStudio is a assignment management app for private music studios. At the end of a one-on-one lesson with a teacher, a student typically receives an assignment for their next lesson. MyStudio allows the teacher to store all previous lessons assignments for each student, and keep them separate by student, which is helpful for teachers with large studios. For the student it allows them a location to reference their lesson notes as to avoid losing or "forgetting" their assignment. 
</div>
<br/>
<p align="center">
  <img max-height: 90% width="100%" src="https://media.giphy.com/media/diK7FREERyFgTu1CLb/giphy.gif" alt="gif of the app">
</p>

## Features 
- Sign in/Sign up option with authenticated password
- View/Edit profile 
- Student and Teacher profiles
- Teachers have full CRUD capabilities for assignment 
- Student have read access to their assignments
 
## Tech Stack
This web app makes use of the following:
- Ruby 
- Sinatra 
- SQLite3 - Database
- BCrypt - Gem for encryption

# To Run
    -Clone this repo
    -Run rake db:migrate 
    -Run shotgun
    -create user or login to begin
