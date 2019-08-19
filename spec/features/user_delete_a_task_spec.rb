require 'rails_helper'

feature 'User delete a task' do
	scenario 'Successfully' do
		task = Task.create(descricao: 'Uma tarefa simples para testar', status: 0)
		visit task_index_url
		click_on 'Editar'

		expect(page).to_not have_css('td',text: task.descricao)
		expect(page).to_not have_css('td',text: task.status)
		expect(page).to_not have_css('tbody td')
	end
end

