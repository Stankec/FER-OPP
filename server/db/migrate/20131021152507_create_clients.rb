class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nameFirst
      t.string :nameLast
      t.string :contactAdress
      t.string :contactTelephone

      t.timestamps
    end
  end
end
