# Smalltalk Employees

This is an assigment for my Programming Languages class in which we had to read in an employee data file containing types of employees, names, and salaries and respond to various commands from the user. For example, the user would write "print ge 2000," and the correct output would be all employees whose total earnings were greater than $2000.

Usage notes are contained in payroll.st but explained here for clarity:

Usage: gst employee.st salaried.st hourly.st commission.st -f payroll.st employee_data_file action

or

Usage: gst employee.st salaried.st hourly.st commission.st -f payroll.st employee_data_file action operator threshold

Valid actions: count print min max total avg 
Valid operators: eq ne gt ge lt le
