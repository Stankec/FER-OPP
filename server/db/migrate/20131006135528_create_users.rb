class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nameFirst
      t.string :nameLast
      t.string :loginUsername
      t.string :loginPasswordHash
      t.string :loginPasswordSalt
      t.string :loginAuthToken
      t.datetime :loginLast
      t.string :contactEmail
      t.string :contactPhone

      t.timestamps
    end
  end
end
