require "selenium-webdriver"

browser = Selenium::WebDriver.for :chrome

titles = ["alice deejay - better off alone"]

# Visit site.
# my-hit.com queries by separating terms using hyphen
# browser.get "http://my-hit.com"

# TODO - Open a file containing list of tracks. Loop through file for each track -- Begin file loop
titles.each do |title|
  # Enter query via URL - string interpolation
  browser.get "http://my-hit.com/#{title}"
  
  # ***Arrive at the results page***
  # Retrieve array of possible track matches be
  # Let's download the first?
  tracks = browser.find_elements(:class, 'item')
  
  begin
    downloads = browser.find_elements(:xpath, "//a[contains(@class, 'dl')]")

    # tracks.first.each do |key, value|
    #     puts key + ' : ' + value
    # end
    puts "#{tracks.first.text}"

    puts "#{downloads[1].text}"
    puts "#{downloads[1].class}"
    puts "#{downloads[1].methods}"
    puts "#{downloads[1].inspect}"
    puts "#{downloads[1].attribute('href')}"

    downloads[1].click
    # browser.get(dl_href)        
        
    # puts "#{downloads.first.value}"
    # puts "#{downloads.first.attribute('href')}"
    
    # downloads.each do |dl|
    #     # puts "#{downloads.first.text}"
    #       dl_href =  dl.attribute('href')#"#{dl.attribute('href')}"
    #       
    #       # browser.get(dl_href)
    #       
    #       sleep 30
    #       break
    #     end
    #     sleep 2
    #   # TODO: Download
  rescue
    puts "Couldn't find the download links"
  end
end
