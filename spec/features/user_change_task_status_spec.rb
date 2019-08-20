require 'rails_helper'

feature 'User change task status' do
	scenario 'successfuly' do
		user = User.create!({:email => "guy@gmail.com", :password => "111111", :password_confirmation => "111111" })
	    visit root_path
	    click_on 'Login'
	    fill_in 'Email', with: "guy@gmail.com"
	    fill_in 'Password', with: "111111"
        click_on 'Log in'

		task = user.tasks.create(descricao: 'Uma tarefa simples para testar', status: 0)
		visit task_index_url
		# expect(current_path).to eq task_index
		click_on 'Trocar status'

		expect(page).to have_css('td',text: task.descricao)
		expect(page).to have_css('td',text: 'done')
	end
end