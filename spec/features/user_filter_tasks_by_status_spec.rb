require 'rails_helper'

feature 'User filter tasks on the tasklist' do
	scenario 'Successfully TODO' do
		Task.create(descricao: 'Uma tarefa simples para testar', status: 0)
		Task.create(descricao: 'Uma tarefa simples para testar', status: 1)
		Task.create(descricao: 'Uma tarefa simples para testar', status: 1)
		Task.create(descricao: 'Uma tarefa simples para testar', status: 1)

		visit task_index_url
		select 'DONE', from: 'Filtrar tasks'
		click_on 'Filtrar'
		expect(page).to have_css('td',text: 'done')
		expect(page).to_not have_css('td',text: 'todo')
	end

	scenario 'Successfully DONE' do
		Task.create(descricao: 'Uma tarefa simples para testar', status: 0)
		Task.create(descricao: 'Uma tarefa simples para testar', status: 0)
		Task.create(descricao: 'Uma tarefa simples para testar', status: 1)
		Task.create(descricao: 'Uma tarefa simples para testar', status: 1)
		Task.create(descricao: 'Uma tarefa simples para testar', status: 1)

		visit task_index_url
		select 'TODO', from: 'Filtrar tasks'
		click_on 'Filtrar'
		expect(page).to_not have_css('td',text: 'done')
		expect(page).to have_css('td',text: 'todo')
	end

	scenario '' do
		skip('ainda não implementei')

	end
end

