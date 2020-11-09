class TeachersController < ApplicationController

  get "/teachers" do
    @user = current_user
    @students = @user.students
    erb :"/teachers/index"
  end
  
  #Account Management#

  get "/teachers/login" do
    erb :"/teachers/login"
  end

  get "/teachers/signup" do
    erb :"/teachers/new"
  end

  post "/teachers/login" do
    user = Teacher.find_by(:email => params[:email])
 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/teachers"
    else
      redirect "/teachers/login"
    end

  end

  # GET: /teachers/5
  get "/teachers/:id" do
    erb :"/teachers/show"
  end

  # GET: /teachers/5/edit
  get "/teachers/:id/edit" do
    erb :"/teachers/edit"
  end

  # PATCH: /teachers/5
  patch "/teachers/:id" do
    redirect "/teachers/:id"
  end

  # DELETE: /teachers/5/delete
  delete "/teachers/:id/delete" do
    redirect "/teachers"
  end

  #Interact with Students from Teacher view#

  get "/teachers/students/:id" do
    #renders the view with previous assignments and has a button to create a new assignment.
    end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= Teacher.find_by(id: session[:user_id]) if session[:user_id]
    end

  end

end
