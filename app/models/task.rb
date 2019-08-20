class Task < ApplicationRecord
	enum status: [:todo, :done]
	belongs_to :user
end
