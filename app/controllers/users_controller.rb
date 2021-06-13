class UsersController < ApplicationController

  get "/users" do
    @user = current_user
  
    if @user.teacher?
      @students = @user.students
      @user_count = @students.count
      erb :"/users/index"
    else
      erb :"/users/index"
    end
  end
  
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
      @teachers = User.all.select {|user| user.teacher?}
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
    if params[:user][:name] == "" || params[:user][:email] == "" || params[:user][:password] == ""
      redirect "/users/signup"
    elsif User.find_by(email: params[:user][:email])
      redirect "/users/login"
    else
      @user = User.new(params[:user])
      @user.save
      session[:user_id] = @user.id
      redirect to '/users'
    end
  end

  get "/users/:id" do
    @user = current_user
    erb :"/users/show"
  end

  get "/users/:id/edit" do
    @user = current_user
    erb :"/users/edit"
  end

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
