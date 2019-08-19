class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :descricao, default: 0
      t.integer :status
      t.timestamps
    end
  end
end
