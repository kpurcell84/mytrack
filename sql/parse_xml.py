
INPUT_FILE = open("search.xml",'r')

def get_vals():
	line = INPUT_FILE.readline()
	all_vals = []
	while line:
		if line[1:6] != 'photo':
			line = INPUT_FILE.readline()
			continue
		vals = []
		val = ''
		build = False
		for char in line:
			if char == '"' and not build:
				build = True
				continue
			elif char == '"' and build:
				build = False
				vals.append(val)
				val = ''

			if build:
				val += char

		all_vals.append(vals)
		line = INPUT_FILE.readline()

	return all_vals

def create_sql_file():
	all_vals = get_vals()
	for vals in all_vals:
		print "INSERT INTO Photo (picid, url, format, date)"
		print "VALUES ('" + vals[0] + "', '/static/img/db/" + vals[2] + "', 'jpg', '" + vals[4] + "');"
		print ""
		print "INSERT INTO Contain (albumid, picid, caption, sequencenum)"
		print "VALUES (5, '" + vals[0] + "', '" + vals[3].replace("'", "\\'") + "', " + vals[0] + ");"
		print ""

if __name__ == '__main__':
	create_sql_file()