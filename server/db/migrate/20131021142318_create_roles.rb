class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.boolean :canViewUsers
      t.boolean :canViewRoles
      t.boolean :canViewOrders
      t.boolean :canViewClients
      t.boolean :canViewVehicles
      t.boolean :canViewProcedures
      t.boolean :canViewSettings
      t.boolean :canViewParts
      t.boolean :canViewworkingHours
      t.boolean :canViewStatements

      t.boolean :canChangeUsers
      t.boolean :canChangeRoles
      t.boolean :canChangeOrders
      t.boolean :canChangeClients
      t.boolean :canChangeVehicles
      t.boolean :canChangeProcedures
      t.boolean :canChangeSettings
      t.boolean :canChangeParts
      t.boolean :canChangeworkingHours
      t.boolean :canChangeStatements

      t.timestamps
    end
  end
end
