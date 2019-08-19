require 'rails_helper'

feature 'User visit task index' do
	scenario 'Successfully' do
		visit task_index_url
	    expect(page).to have_css('h1', text: 'Tasks')
    	expect(page).to have_css('p', text: 'Aqui estão listadas todas as tasks cadastradas.')
	end

	scenario 'and view task' do
		task = Task.create!(descricao: 'aaaaaaaaaaaaaaa', status: 1)	
	    
		visit task_index_url

	    expect(page).to have_css('td',text: task.descricao)
	    expect(page).to have_css('td',text: task.status)
	end
end
