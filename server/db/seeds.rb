# encoding: UTF-8
settings = Setting.new
settings.pageTitle = "Mehaničar"
settings.pageDescription = "Popravljamo sve od gepufne do cinculatora"
settings.save

role = Role.new
role.name = "Admin"
  role.canViewUsers = true
  role.canViewRoles = true
  role.canViewOrders = true
  role.canViewClients = true
  role.canViewVehicles = true
  role.canViewProcedures = true
  role.canViewSettings = true
  role.canViewParts = true
  role.canViewWorkingHours = true
  role.canViewStatements = true
  role.canViewNetworks = true
  role.canViewPages = true
  role.canViewCategories = true
  #
  role.canChangeUsers = true
  role.canChangeRoles = true
  role.canChangeOrders = true
  role.canChangeClients = true
  role.canChangeVehicles = true
  role.canChangeProcedures = true
  role.canChangeSettings = true
  role.canChangeParts = true
  role.canChangeWorkingHours = true
  role.canChangeStatements = true
  role.canChangeNetworks = true
  role.canChangePages = true
  role.canChangeCategories = true
  #
  role.isDeleteable = false;
role.save

role = Role.new
role.name = "Mehaničar"
  role.canViewUsers = false
  role.canViewRoles = false
  role.canViewOrders = true
  role.canViewClients = true
  role.canViewVehicles = true
  role.canViewProcedures = true
  role.canViewSettings = false
  role.canViewParts = true
  role.canViewWorkingHours = true
  role.canViewStatements = false
  role.canViewNetworks = false
  role.canViewPages = true
  role.canViewCategories = false
  #
  role.canChangeUsers = false
  role.canChangeRoles = false
  role.canChangeOrders = false
  role.canChangeClients = false
  role.canChangeVehicles = false
  role.canChangeProcedures = false
  role.canChangeSettings = false
  role.canChangeParts = false
  role.canChangeWorkingHours = false
  role.canChangeStatements = false
  role.canChangeNetworks = false
  role.canChangePages = false
  role.canChangeCategories = false
role.save

role = Role.new
role.name = "Električar"
  role.canViewUsers = false
  role.canViewRoles = false
  role.canViewOrders = true
  role.canViewClients = true
  role.canViewVehicles = true
  role.canViewProcedures = true
  role.canViewSettings = false
  role.canViewParts = true
  role.canViewWorkingHours = true
  role.canViewStatements = false
  role.canViewNetworks = false
  role.canViewPages = true
  role.canViewCategories = false
  #
  role.canChangeUsers = false
  role.canChangeRoles = false
  role.canChangeOrders = false
  role.canChangeClients = false
  role.canChangeVehicles = false
  role.canChangeProcedures = false
  role.canChangeSettings = false
  role.canChangeParts = false
  role.canChangeWorkingHours = false
  role.canChangeStatements = false
  role.canChangeNetworks = false
  role.canChangePages = false
  role.canChangeCategories = false
role.save

role = Role.new
role.name = "Voditelj Servisa"
  role.canViewUsers = true
  role.canViewRoles = false
  role.canViewOrders = true
  role.canViewClients = true
  role.canViewVehicles = true
  role.canViewProcedures = true
  role.canViewSettings = false
  role.canViewParts = true
  role.canViewWorkingHours = true
  role.canViewStatements = false
  role.canViewNetworks = false
  role.canViewPages = true
  role.canViewCategories = false
  #
  role.canChangeUsers = true
  role.canChangeRoles = false
  role.canChangeOrders = true
  role.canChangeClients = true
  role.canChangeVehicles = true
  role.canChangeProcedures = true
  role.canChangeSettings = false
  role.canChangeParts = true
  role.canChangeWorkingHours = false
  role.canChangeStatements = false
  role.canChangeNetworks = false
  role.canChangePages = false
  role.canChangeCategories = false
role.save

role = Role.new
role.name = "Direktor"
  role.canViewUsers = true
  role.canViewRoles = false
  role.canViewOrders = true
  role.canViewClients = false
  role.canViewVehicles = false
  role.canViewProcedures = false
  role.canViewSettings = false
  role.canViewParts = false
  role.canViewWorkingHours = true
  role.canViewStatements = true
  role.canViewNetworks = false
  role.canViewPages = true
  role.canViewCategories = false
  #
  role.canChangeUsers = true
  role.canChangeRoles = false
  role.canChangeOrders = true
  role.canChangeClients = false
  role.canChangeVehicles = false
  role.canChangeProcedures = false
  role.canChangeSettings = false
  role.canChangeParts = false
  role.canChangeWorkingHours = true
  role.canChangeStatements = false
  role.canChangeNetworks = false
  role.canChangePages = false
  role.canChangeCategories = false
role.save
  		
user = User.new
user.nameFirst = "Nemo"
user.nameLast  = "Nihili"
user.loginUsername 	= "admin"
user.password 		= "admin"
user.roles << Role.where(:name => "Admin").first
user.isDeleteable = false
user.save

wh = WorkingHour.new
  wh.day = 0
  wh.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
  wh.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
  wh.exception = false
wh.save
wh = WorkingHour.new
  wh.day = 1
  wh.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
  wh.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
  wh.exception = false
wh.save
wh = WorkingHour.new
  wh.day = 2
  wh.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
  wh.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
  wh.exception = false
wh.save
wh = WorkingHour.new
  wh.day = 3
  wh.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
  wh.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
  wh.exception = false
wh.save
wh = WorkingHour.new
  wh.day = 4
  wh.timeStart = Time.now.in_time_zone('London').change(:hour => 8, :min => 0)
  wh.timeFinish = Time.now.in_time_zone('London').change(:hour => 16, :min => 0)
  wh.exception = false
wh.save

vehicle = Vehicle.new
vehicle.vehicleModel        = "Renault Clio"
vehicle.buildYear           = 1990
vehicle.vehicleRegistration = "ZG 0001 VP"
vehicle.save

vehicle = Vehicle.new
vehicle.vehicleModel        = "Ford Fiesta"
vehicle.buildYear           = 2008
vehicle.vehicleRegistration = "ZG 0002 SK"
vehicle.save

vehicle = Vehicle.new
vehicle.vehicleModel        = "Aston Martin Vanquish"
vehicle.buildYear           = 2005
vehicle.vehicleRegistration = "ZG 0003 MP"
vehicle.save

vehicle = Vehicle.new
vehicle.vehicleModel        = "Rolls Royce"
vehicle.buildYear           = 1989
vehicle.vehicleRegistration = "ZG 0004 MP"
vehicle.save

vehicle = Vehicle.new
vehicle.vehicleModel        = "Volvo S60"
vehicle.buildYear           = 2013
vehicle.vehicleRegistration = "ZG 0005 MS"
vehicle.save

vehicle = Vehicle.new
vehicle.vehicleModel        = "Volkswagen Golf"
vehicle.buildYear           = 1990
vehicle.vehicleRegistration = "ZG 0006 MS"
vehicle.save

vehicle = Vehicle.new
vehicle.vehicleModel        = "Lamborgini Avantador"
vehicle.buildYear           = 2012
vehicle.vehicleRegistration = "ZG 0007 MS"
vehicle.save

vehicle = Vehicle.new
vehicle.vehicleModel        = "Smart fortwo cupe"
vehicle.buildYear           = 2004
vehicle.vehicleRegistration = "ZG 0008 ZL"
vehicle.save

vehicle = Vehicle.new
vehicle.vehicleModel        = "Tesla Roadster"
vehicle.buildYear           = 2011
vehicle.vehicleRegistration = "ZG 0009 ZL"
vehicle.save

client = Client.new
client.nameFirst        = "Vlaho"
client.nameLast         = "Poluta"
client.contactAdress    = "Gundulićeva 56a"
client.contactTelephone = "00385 1 1234 561"
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0001 VP").first
client.save

client = Client.new
client.nameFirst        = "Stanko"
client.nameLast         = "Krtalić Rusendić"
client.contactAdress    = "Ilica 122"
client.contactTelephone = "00385 1 1234 562"
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0002 SK").first
client.save

client = Client.new
client.nameFirst        = "Marin"
client.nameLast         = "Pogančić"
client.contactAdress    = "Radićeva 16"
client.contactTelephone = "00385 1 1234 563"
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0003 MP").first
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0004 MP").first
client.save

client = Client.new
client.nameFirst        = "Martin"
client.nameLast         = "Sertić"
client.contactAdress    = "Vukovarska 23a"
client.contactTelephone = "00385 1 1234 563"
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0005 MS").first
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0006 MS").first
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0007 MS").first
client.save

client = Client.new
client.nameFirst        = "Mateja"
client.nameLast         = "Škriljak"
client.contactAdress    = "Petrova 73"
client.contactTelephone = "00385 1 1234 564"
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0005 MS").first
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0006 MS").first
client.save

client = Client.new
client.nameFirst        = "Mirjam"
client.nameLast         = "Škarica"
client.contactAdress    = "Vlaška 43b"
client.contactTelephone = "00385 1 1234 565"
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0006 MS").first
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0007 MS").first
client.save

client = Client.new
client.nameFirst        = "Zrinka"
client.nameLast         = "Lekić"
client.contactAdress    = "Draškovićeva 3"
client.contactTelephone = "00385 1 1234 565"
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0008 ZL").first
client.vehicles << Vehicle.where(:vehicleRegistration => "ZG 0009 ZL").first
client.save

part = Part.new
part.name        = "Mineralno ulje"
part.quantity    = 46.3
part.price       = 42.60
part.description = "Ulje za motore"
part.save

part = Part.new
part.name        = "Ljetne gume"
part.quantity    = 14.0
part.price       = 200.00
part.description = "Ljetne gume"
part.save

part = Part.new
part.name        = "Zimske gume"
part.quantity    = 61.0
part.price       = 236.00
part.description = "Zimske gume"
part.save

part = Part.new
part.name        = "Zupčasti remen"
part.quantity    = 361.00
part.price       = 39.99
part.description = "Zupčasti remen"
part.save

part = Part.new
part.name        = "Akumulator"
part.quantity    = 18.00
part.price       = 289.50
part.description = "Akumulator 12V 5600Ah"
part.save

part = Part.new
part.name        = "Klip"
part.quantity    = 2.00
part.price       = 460.50
part.description = "Motorni klip"
part.save

part = Part.new
part.name        = "Ispušna cijev"
part.quantity    = 56.00
part.price       = 86.99
part.description = "Auspuh"
part.save

procedure = Procedure.new
procedure.name            = "Zamjena ulja"
procedure.description     = "Izvadi staro ulje van, ulij novo unutra..."
procedure.minNumOfWorkers = 1
procedure.duration        = 1.0
procedure.manHour         = 32.0
procedure.part_procedures << PartProcedure.create(part_id: Part.where(:name => "Mineralno ulje").first.id, procedure_id: procedure.id, quantity: 30.6)
procedure.save


procedure = Procedure.new
procedure.name            = "Postavljanje zimskih guma"
procedure.description     = "Skini stare gume, uzmi 4 nove zimske i montiraj ih..."
procedure.minNumOfWorkers = 1
procedure.duration        = 0.5
procedure.manHour         = 32.0
procedure.part_procedures << PartProcedure.create(part_id: Part.where(:name => "Zimske gume").first.id, procedure_id: procedure.id, quantity: 4.0)
procedure.save

procedure = Procedure.new
procedure.name            = "Postavljanje ljetnih guma"
procedure.description     = "Skini stare gume, uzmi 4 nove ljetne i montiraj ih..."
procedure.minNumOfWorkers = 1
procedure.duration        = 0.5
procedure.manHour         = 32.0
procedure.part_procedures << PartProcedure.create(part_id: Part.where(:name => "Ljetne gume").first.id, procedure_id: procedure.id, quantity: 4.0)
procedure.save

procedure = Procedure.new
procedure.name            = "Popravak motora"
procedure.description     = "Zamjeni zupčasti remen i 6 klipova"
procedure.minNumOfWorkers = 4
procedure.duration        = 6.0
procedure.manHour         = 80.0
procedure.part_procedures << PartProcedure.create(part_id: Part.where(:name => "Zupčasti remen").first.id, procedure_id: procedure.id, quantity: 1.0)
procedure.part_procedures << PartProcedure.create(part_id: Part.where(:name => "Klip").first.id, procedure_id: procedure.id, quantity: 6.0)
procedure.save

procedure = Procedure.new
procedure.name            = "Zamjena akumulatora"
procedure.description     = "Baci stari i ugradi novi"
procedure.minNumOfWorkers = 1
procedure.duration        = 0.1
procedure.manHour         = 10.0
procedure.part_procedures << PartProcedure.create(part_id: Part.where(:name => "Akumulator").first.id, procedure_id: procedure.id, quantity: 1.0)
procedure.save

procedure = Procedure.new
procedure.name            = "Zamjena auspuha"
procedure.description     = "Nisam siguran niti ja..."
procedure.minNumOfWorkers = 2
procedure.duration        = 2.0
procedure.manHour         = 50.0
procedure.part_procedures << PartProcedure.create(part_id: Part.where(:name => "Ispušna cijev").first.id, procedure_id: procedure.id, quantity: 1.0)
procedure.save

from_date = Date.new(2012, 1, 1)
to_date   = Date.yesterday
h_month   = from_date.month
h_year    = from_date.year
(from_date..to_date).each { |d| 
  type = 0
  if d.month > h_month && d.year == h_year
    type = 1
    h_month = d.month
    d = d.last_month
  end
  if d.year > h_year
    type = 2
    h_year = d.year
    h_month = d.month
    d = d.last_year
  end
  statement = Statement.new
  statement.statemnetType = type
  statement.statementDate = d
  statement.money = 1000 + rand(9999)
  statement.save
}