require 'rubygems'
require 'mysql2'

filename = ARGV[0]
DB_NAME = "test"

column_names = []
f = File.open(filename)
f.each_with_index do |line, idx|
  break if idx == 1
  line[0..-2].split("\t").each do |name|
    column_names << name
  end
end
table_name = "#{filename.split('/')[-1].split('.')[0]}"
columns = ""

column_names.each_with_index do |name, idx|
  if idx == 0
    columns += "#{name} INT NOT NULL AUTO_INCREMENT PRIMARY KEY,"
  else
    columns += "#{name} TEXT,"
  end
end

columns = columns[0..-2]

table_query = "CREATE TABLE #{table_name} (#{columns});"
puts table_query
#p column_names

load_query = "LOAD DATA INFILE '#{File.expand_path(filename)}' INTO TABLE #{DB_NAME}.#{table_name};"
puts load_query
