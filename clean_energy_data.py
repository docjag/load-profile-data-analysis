# @Author: Sohel Mahmud
# @Date: 23-11-16
# @Describe: 

import os
from os import path
from datetime import datetime, timedelta

main_dir_path = os.getcwd() + '/Sazzad/profileonemonth/'

def real_power_retriever(each_day, filename):

	print each_day, filename

	with open('write_me.txt','a') as file_hand:
		file_hand.write(each_day + '->' + filename + '\n')
	
	file = main_dir_path + each_day + '/' + filename

	with open(file,'rb') as fhand:

		# Skipping first 6 lines
		for i in range(1, 7):
			fhand.next()

		for line in fhand:
			line = line.rstrip()			

			if line.startswith('2'):
				print 'wrong character detected!!'
				break

			data = line.split(';')
			date_curr = data[0][1:-1]
			time_t = data[1]
			real_power = data[2].lstrip()

			print 'Current Week: ', real_power

			real_power = float(real_power.replace(',','.'))

			dir_name, file_prev = previous_date_file(filename, date_curr)
			# print dir_name
			# print file_prev

			if real_power == 0:	
				real_power2  = get_previous_week(dir_name, file_prev, time_t)
				print 'Last Week: ', real_power2
			else: real_power2 = real_power

			with open('write_me.txt','a') as file_hand:
				file_hand.write('Current: ' + str(real_power)+'\tPrevious: '+ str(real_power2) +'\n')

def get_previous_week(dir_name, filename, time_t):

	filename = main_dir_path + dir_name + '/' + filename

	with open(filename,'rb') as fhand:
		for i in range(1, 7):
			fhand.next()
		
		for line in fhand:
			line = line.rstrip()
			data = line.split(';')
			time_prev = data[1]
			
			if time_prev == time_t:
				real_power = data[2].lstrip()
				break

	return real_power

def previous_date_file(filename, current_date):

	name_parts = filename.split('_')
	file_prev =  name_parts[0] + '_' + name_parts[1] + '_'

	current_date = datetime.strptime(current_date, "%d.%m.%Y")

	dir_name = date_prev = current_date - timedelta(days = 7)
	
	dir_name = dir_name.strftime('%d-%b-%Y')
	date_prev = date_prev.strftime('%Y%m%d')

	# print 'directory name: ', dir_name
	# print 'previoius date: ', date_prev

	date_prev_str = str(date_prev).replace('-','')

	file_prev = file_prev + date_prev_str + '000000.csv'

	return dir_name, file_prev

def get_dir_names():

	# List comprehension for extracting the names of the files in firebrowse directory and sort the names
	days_dir = [x for x in os.listdir(main_dir_path)]

	days_dir.sort()
	
	return days_dir

def files_list(day_dir):

	day_dir_path = main_dir_path + day_dir 

	# List comprehension for extracting the names of the files in firebrowse directory
	files = [x for x in os.listdir(day_dir_path)]

	files.sort()

	return files

# #################################################
# ############ Main body of the program: ##########
# #################################################

# Get the directory names
days_dir_list = get_dir_names()

#Going through each directory representing each day
for each_day in days_dir_list[7:]:
	files = files_list(each_day)
	for file in files:
		real_power_retriever(each_day, file)