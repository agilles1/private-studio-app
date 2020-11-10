class AssignmentsController < ApplicationController

  # GET: /assignments

  get "/assignments" do
    @user=User.find(current_user.id)
    erb :"assignments/index"
  end

  get "/assignments/students/:id" do
    if current_user.teacher?
      @student = User.find(params[:id])
      erb :"/assignments/teachers/index"
    else
      redirect '/users'
    end
  end

  # GET: /assignments/new
  get "/assignments/students/:id/new" do
    if current_user.teacher?
      @student = User.find(params[:id])
      erb :"/assignments/new"
    else
      redirect "/users"
    end
  end

  # POST: /assignments
  post "/assignments" do
    if params[:content] != ""
      Assignment.create(params)
      redirect "/assignments/students/#{params[:student_id]}"
    else
      redirect "/assignments/students/#{params[:student_id]}/new"
    end
  end

  # GET: /assignments/5
  get "/assignments/:id" do
    erb :"/assignments/show"
  end

  # GET: /assignments/5/edit
  get "/assignments/:id/edit" do
    if current_user.teacher?
    @assignment = Assignment.find(params[:id])
    erb :"/assignments/edit"
    else
      redirect "/users"
    end
  end

  # PATCH: /assignments/5
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

  # DELETE: /assignments/5/delete
  delete "/assignments/:id/delete" do
    assignment = Assignment.find(params[:id])
    student = assignment.student
    assignment.destroy
    redirect "/assignments/students/#{student.id}"
  end
end
