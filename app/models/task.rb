class Task < ApplicationRecord
	enum status: [:todo, :done]
end
