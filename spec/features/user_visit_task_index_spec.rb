require 'rails_helper'

feature 'User visit task index' do
	scenario 'Successfully' do
		user = User.create!({:email => "guy@gmail.com", :password => "111111", :password_confirmation => "111111" })
	    visit root_path
	    click_on 'Login'
	    fill_in 'Email', with: "guy@gmail.com"
	    fill_in 'Password', with: "111111"
        click_on 'Log in'

		visit task_index_url
	    expect(page).to have_css('h1', text: 'Tasks')
    	expect(page).to have_css('p', text: 'Aqui estão listadas todas as tasks cadastradas.')
	end

	scenario 'and view task' do
		user = User.create!({:email => "guy@gmail.com", :password => "111111", :password_confirmation => "111111" })
	    visit root_path
	    click_on 'Login'
	    fill_in 'Email', with: "guy@gmail.com"
	    fill_in 'Password', with: "111111"
        click_on 'Log in'

		task = user.tasks.create!(descricao: 'aaaaaaaaaaaaaaa', status: 1)	
	    
		visit task_index_url

	    expect(page).to have_css('td',text: task.descricao)
	    expect(page).to have_css('td',text: task.status)
	end
end
