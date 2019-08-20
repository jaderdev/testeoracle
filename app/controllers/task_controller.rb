class TaskController < ApplicationController
	before_action :authenticate_user!
	def index
		if params[:filter].nil?
			@tasks = current_user.tasks
		else
			@tasks = current_user.tasks.where("status = #{params[:filter]}")
		end
	end

	def new
		@task = Task.new
	end

	def create
		@task = current_user.tasks.new(task_params)
		@task.status = 0 
		@task.save
		redirect_to task_index_url
	end

	def edit
		if(current_user.tasks.exists?(params[:id]))
		@task = Task.find(params['id'])
		else
		flash[:notice] = "Vocẽ não pode editar esse task por não ser seu"
		redirect_to task_index_url
	end
	end

	def update
		if(current_user.tasks.exists?(params[:id]))
		@task = Task.find(params['id'])
		@task.update(task_params)
		redirect_to task_index_url
		else
		flash[:notice] = "Vocẽ não pode editar esse task por não ser seu"
		redirect_to task_index_url
		end
	end

	def destroy
		if(current_user.tasks.exists?(params[:id]))
		@task = Task.find(params['id'])
		@task.destroy
		redirect_to task_index_url
		else
		flash[:notice] = "Vocẽ não pode editar esse task por não ser seu"
		redirect_to task_index_url
		end
	end

	def toggle_status
		if(current_user.tasks.exists?(params[:id]))
		@task = Task.find(params['id'])
		@task.status = @task.status == 'todo' ? 'done' : 'todo'
		@task.save()
		redirect_to task_index_url
		else
		flash[:notice] = "Vocẽ não pode editar esse task por não ser seu"
		redirect_to task_index_url
		end
	end

	private

	def task_params
	    params.require(:task).permit(:descricao, :status)
	end

end
