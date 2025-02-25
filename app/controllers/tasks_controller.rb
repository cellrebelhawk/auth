class TasksController < ApplicationController
  def index
    @user = User.find_by({"id" => session["user_id"]})
    @tasks = Task.where({"user_id"=> session["user_id"]})
  end



  def create
    @task = Task.new
    @task["description"] = params["description"]
    @task["user_id"] = session["user_id"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"], "user_id" => session["user_id"]})
    @task.destroy
    redirect_to "/tasks"
  end
end
