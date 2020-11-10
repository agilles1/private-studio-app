class AssignmentsController < ApplicationController

  # GET: /assignments
  get "/assignments" do
    erb :"/assignments/index.html"
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
    @student = User.find(params[:id])
    erb :"/assignments/new"
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
    erb :"/assignments/edit.html"
  end

  # PATCH: /assignments/5
  patch "/assignments/:id" do
    redirect "/assignments/:id"
  end

  # DELETE: /assignments/5/delete
  delete "/assignments/:id/delete" do
    redirect "/assignments"
  end
end
