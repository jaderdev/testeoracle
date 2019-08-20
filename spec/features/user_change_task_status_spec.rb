require 'rails_helper'

feature 'User change task status' do
	scenario 'successfuly' do
		task = Task.create(descricao: 'Uma tarefa simples para testar', status: 0)
		visit task_index_url
		click_on 'Trocar status'

		expect(page).to have_css('td',text: task.descricao)
		expect(page).to have_css('td',text: 1)
	end
end