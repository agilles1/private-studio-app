class UsersController < ApplicationController

  get "/users" do
    @user = current_user
    @students = @user.students
    erb :"/users/index"
  end
  
  #Account Management#
  patch "/users/:id" do
    binding.pry
    redirect "/users/:id"
  end

  get "/users/login" do
    erb :"/users/login"
  end

  get "/users/signup" do
    erb :"/users/new"
  end

  post "/users/login" do
    user = Teacher.find_by(:email => params[:email])
 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users"
    else
      redirect "/users/login"
    end

  end

  post "/users" do
    if params[:name] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/users/signup'
    else
      @user = Teacher.new(params[:teacher])
      @user.save
      session[:user_id] = @user.id
      redirect to '/users'
    end
  end

   # GET: /users/5
  get "/users/:id" do
    @user = current_user
    erb :"/users/show"
  end

    # GET: /users/5/edit
  get "/users/:id/edit" do
    @user = current_user
    erb :"/users/edit"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    current_user.delete
    redirect "/users"
  end

  #Interact with Students from Teacher view#

  get "/users/students/:id" do
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
