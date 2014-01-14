class Statement < ActiveRecord::Base
	def self.calculateStatements
		puts "Starting statement calculation @ " + Time.now.to_s

		# Is there a statement for today?
		if Statement.where(:statementDate => Date.today).any?
			return
		end

		# Has enough time passed?
		weekDay = Date.today.wday
		if weekDay == 0
			weekDay = 6
		else
			weekDay -= 1
		end

		# Determine time to calculate
		statementTime = nil
		if WorkingHour.where(:day => weekDay).any?
			statementTime = WorkingHour.where(:day => weekDay).first.timeFinish
		end

		# Check for exceptions
		if WorkingHour.where(:exceptiondate => Date.today).any?
			statementTime = WorkingHour.where(:exceptiondate => Date.today).first.timeFinish
		end

		# Is there a time specified?
		if statementTime == nil
			return
		end

		# Has enough time passed?
		if Time.now.hour < statementTime.hour && Time.now.min < statementTime.min
			return
		end

		# Calculate balance
		totalBalance = 0
		Order.where("status = :status AND timeFinish > :midnightToday AND timeFinish < :midnightTomorrow",
					:status => 3,
					:midnightToday => Date.today.midnight,
					:midnightTomorrow => Date.tomorrow.midnight).each do |order|
			# Calculate parts
			sumParts = 0
			order.order_parts.each do |part|
				sumParts += part.quantity * part.part.price
			end

			# Calculate procedures
			sumProcedure = 0
			sumProcedureParts = 0
			order.order_procedures.each do |procedure|
				procedure = procedure.procedure
				sumProcedure += procedure.minNumOfWorkers * procedure.duration * procedure.manHour
				# Calculate parts used in a procedure
				procedure.part_procedures.each do |part|
					sumProcedureParts += part.quantity * part.part.price
				end
			end

			totalBalance += sumParts + sumProcedure + sumProcedureParts
		end

		# Create statement
		statement = Statement.new
		statement.statemnetType = 0
		statement.statementDate = Date.today
		statement.money = totalBalance
		statement.save

		puts "Created DAILY statement @ " + Time.now.to_s

		# Create monthly statement
		latestStatement = Statement.where("statemnetType = 0").order("statementDate DESC").first
		if latestStatement == nil
			return
		end

		if statement.statementDate.month > latestStatement.statementDate.month && statement.statementDate.year == latestStatement.statementDate.year
			totalBalance = 0
			Statement.where("statemnetType = :statemnetType AND statementDate >= :monthLastStart AND statementDate <= :monthThisStart",
							:statemnetType => 0,
							:monthLastStart => Date.today.at_beginning_of_month.last_month,
							:monthThisStart => Date.today.at_beginning_of_month).each do |statement|

				totalBalance += statement.money

				statement = Statement.new
				statement.statemnetType = 1
				statement.statementDate = Date.last_month.at_end_of_month
				statement.money = totalBalance
				statement.save

				puts "Created MONTHLY statement @ " + Time.now.to_s
			end
		end

		# Create annual statement
		if statement.statementDate.year > latestStatement.statementDate.year
			totalBalance = 0
			Statement.where("statemnetType = :statemnetType AND statementDate >= :monthLastStart AND statementDate <= :monthThisStart",
							:statemnetType => 1,
							:monthLastStart => Date.new(Date.today.year - 1, 1, 1),
							:monthThisStart => Date.new(Date.today.year - 1, 12, 31)).each do |statement|

				totalBalance += statement.money

				statement = Statement.new
				statement.statemnetType = 2
				statement.statementDate = Date.new(Date.today.year - 1, 12, 31)
				statement.money = totalBalance
				statement.save

				puts "Created YEARLY statement @ " + Time.now.to_s
			end
		end

		# Tadah! We are finished!
	end
end
