require 'rails_helper'

feature 'User filter tasks on the tasklist' do
	scenario 'Successfully TODO' do
		user = User.create!({:email => "guy@gmail.com", :password => "111111", :password_confirmation => "111111" })
	    visit root_path
	    click_on 'Login'
	    fill_in 'Email', with: "guy@gmail.com"
	    fill_in 'Password', with: "111111"
        click_on 'Log in'

		user.tasks.create(descricao: 'Uma tarefa simples para testar', status: 0)
		user.tasks.create(descricao: 'Uma tarefa simples para testar', status: 1)
		user.tasks.create(descricao: 'Uma tarefa simples para testar', status: 1)
		user.tasks.create(descricao: 'Uma tarefa simples para testar', status: 1)

		visit task_index_url
		select 'DONE', from: 'Filtrar tasks'
		click_on 'Filtrar'
		expect(page).to have_css('td',text: 'done')
		expect(page).to_not have_css('td',text: 'todo')
	end

	scenario 'Successfully DONE' do
		user = User.create!({:email => "guy@gmail.com", :password => "111111", :password_confirmation => "111111" })
	    visit root_path
	    click_on 'Login'
	    fill_in 'Email', with: "guy@gmail.com"
	    fill_in 'Password', with: "111111"
        click_on 'Log in'

		user.tasks.create(descricao: 'Uma tarefa simples para testar', status: 0)
		user.tasks.create(descricao: 'Uma tarefa simples para testar', status: 0)
		user.tasks.create(descricao: 'Uma tarefa simples para testar', status: 1)
		user.tasks.create(descricao: 'Uma tarefa simples para testar', status: 1)
		user.tasks.create(descricao: 'Uma tarefa simples para testar', status: 1)

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

