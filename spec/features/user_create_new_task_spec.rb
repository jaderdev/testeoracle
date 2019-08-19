require 'rails_helper'

feature 'User create a new task' do
	scenario 'Successfully' do
		task = Task.new(descricao: 'Uma tarefa simples para testar', status: 0)
		visit new_task_url
		fill_in 'Descrição da tarefa',with: task.descricao
		select 'TODO', from: 'Status da tarefa'
		click_on 'Criar'

		expect(page).to have_css('td',text: task.descricao)
		expect(page).to have_css('td',text: task.status)
	end
end

