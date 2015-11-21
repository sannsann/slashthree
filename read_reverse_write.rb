
begin
  source = File.new('tracks.txt', 'r')
  output = File.new('output.txt', 'w')
  source.each_line do |line|
    output.write(line.reverse)
  end
  
  source.close
  output.close
  
rescue
  puts "Error opening file."
end