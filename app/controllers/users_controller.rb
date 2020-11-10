class UsersController < ApplicationController

  get "/users" do
    @user = current_user
  
    if @user.teacher?
      @students = @user.students
      erb :"/users/index"
    else
      erb :"/users/index"
    end
  end
  
  #Account Management#
  get "/users/login" do
    if logged_in?
      redirect "/users"
    else
      erb :"/users/login"
    end
  end

  get "/users/signup" do
    if logged_in?
      redirect "/users"
    else
      @teachers = User.where(teacher_id: nil)
      erb :"/users/new"
    end
  end

  post "/users/login" do
    user = User.find_by(:email => params[:email])
 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users"
    else
      redirect "/users/login"
    end

  end

  post "/users/logout" do
    session.clear
    redirect "/users/login"
  end

  post "/users" do
    if params[:name] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/users/signup'
    else
      @user = User.new(params[:user])
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
    redirect "/users/login"
  end

  patch "/users/:id" do
    @user = User.find(params[:user][:id])
    @user.update(params[:user])
    redirect "/users/:id"
  end

end
