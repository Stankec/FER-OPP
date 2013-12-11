class RolesController < ApplicationController
  def index
  	@role = Role.all
  end

  def new
  	@role = Role.new
  end

  def edit
  	@role = Role.find_by id: params[:id]
  end

  ##################
  ### Rails CRUD ###
  ##################

  def role_params
        params.require(:role).permit(	:name,
        								
        								:canViewUsers,
										:canViewRoles,
										:canViewOrders,
										:canViewClients,
										:canViewVehicles,
										:canViewProcedures,
										:canViewSettings,
										:canViewParts,
										:canViewworkingHours,
										:canViewStatements,
										:canViewNetworks,
										:canViewPages,
										:canViewCategories,

										:canChangeUsers,
										:canChangeRoles,
										:canChangeOrders,
										:canChangeClients,
										:canChangeVehicles,
										:canChangeProcedures,
										:canChangeSettings,
										:canChangeParts,
										:canChangeworkingHours,
										:canChangeStatements,
										:canChangeNetworks,
										:canChangePages,
										:canChangeCategories)
    end

    def create
  		@role = Role.new(role_params)
  		if @role.save
  			redirect_to roles_path
  		else
  			render "new"
  		end
  	end # create
	
  	def update
  		@role = Role.find_by id: params[:id]
  		if @role.update_attributes(role_params)
  			redirect_to roles_path
  		else
  			render "edit"
  		end
  	end # update
	
  	def destroy
  		@role = Role.find_by id: params[:id]
  		if @role.destroy
  			redirect_to roles_path
  		else
  			redirect_to :back
  		end
  	end # delete
end
