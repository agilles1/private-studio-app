class AssignmentsController < ApplicationController

  get "/assignments" do
    @user=User.find(current_user.id)
    erb :"assignments/index"
  end

  get "/assignments/students/:id" do
    @student = User.find(params[:id])
  
    if is_authorized(@student)
      erb :"/assignments/teachers/index"
    else
      redirect '/users'
    end
  end

  get "/assignments/students/:id/new" do
    @student = User.find(params[:id])
    if current_user.teacher? && @student.teacher == current_user
      @teacher = current_user
      erb :"/assignments/new"
    else
      redirect "/users"
    end
  end

  post "/assignments" do
    if params[:content] != ""
      Assignment.create(params)
      redirect "/assignments/students/#{params[:student_id]}"
    else
      redirect "/assignments/students/#{params[:student_id]}/new"
    end
  end

  get "/assignments/:id/edit" do
    @assignment = Assignment.find(params[:id])
    
    if current_user.teacher? && @assignment.teacher == current_user
      
    @teacher = current_user
    erb :"/assignments/edit"
    else
      redirect "/users"
    end
  end

  patch "/assignments/:id" do
    if params[:assignment][:content] != ""
      assignment = Assignment.find(params[:assignment][:id])
      assignment.update(params[:assignment])
      redirect "/assignments/students/#{assignment.student.id}"
    else
      assignment = Assignment.find(params[:assignment][:id])
      redirect "/assignments/students/#{assignment.student.id}"
    end
  end

  delete "/assignments/:id/delete" do
    assignment = Assignment.find(params[:id])
    student = assignment.student
    if assignment.teacher == current_user
      assignment.destroy
    end
    redirect "/assignments/students/#{student.id}"
  end

end
