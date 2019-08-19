class TaskController < ApplicationController

	def index
		@tasks = Task.all()
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		@task.status = 0 
		@task.save
		redirect_to task_index_url
	end

	def task_params
	    params.require(:task).permit(:descricao, :status)
	end
end
