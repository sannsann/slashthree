require "selenium-webdriver"

# Note: my-hit.com queries by separating terms using hyphen

# Open a file containing list of tracks. 
begin 
  source = File.new('tracks.txt', 'r')
rescue
  puts "Error opening source file."
end
  
# Loop through file for each track -- Begin file loop
source.each_line do |track|
  browser = Selenium::WebDriver.for :chrome
  
  # Use string interpolation to enter query (via URL)
  browser.get "http://my-hit.com/#{track}"
  sleep 3
  
  # ***Arrive at the results page***
  # Retrieve array of possible track matches
  # Let's download the first? First one is usually null
  
  begin
    downloads = browser.find_elements(:xpath, "//a[contains(@class, 'dl')]")
    # First anchor tag in downloads seems to be empty, get the second Element in array
    puts "#{downloads[1].text}"
    # puts "#{downloads[1].class}"
    # puts "#{downloads[1].methods}"
    # puts "#{downloads[1].inspect}"
    puts "#{downloads[1].attribute('href')}"

    downloads[1].click
    sleep 120
    
    browser.close
  rescue
    puts "Couldn't find the download links for #{track}"
  end
end
