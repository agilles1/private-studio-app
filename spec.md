# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database [established connection to my database and defined relationships to facilitate in utilizing a relational database]
- [x] Include more than one model class (e.g. User, Post, Category) [User (with self join to account for different user types) & Assignments]
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) [Teacher has_many Students AND Students has_many assignements AND Teachers has_many assignments through Students]
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) [Student belongs to teacher AND Assignment belongs_to Student]
- [x] Include user accounts with unique login attribute (username or email) [user validated with email]
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying [Teachers can create, read, update and destroy assignments]
- [x] Ensure that users can't modify content created by other users [Use sessions to limit to current_user]
- [x] Include user input validations [Done when creating a new user or assignment. Will not allow ""]
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm [Could be better at committing more often.]
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
