# Set up for the application and database. DO NOT CHANGE. #############################
require "sequel"                                                                      #
connection_string = ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite3"  #
DB = Sequel.connect(connection_string)                                                #
#######################################################################################

# Database schema - this should reflect your domain model
DB.create_table! :events do
  primary_key :id
  String :title
  String :description, text: true
  String :date
  String :location
  String :image
end
DB.create_table! :rsvps do
  primary_key :id
  foreign_key :event_id
  Boolean :running_status
  String :name
  String :email
  String :comments, text: true
end

# Insert initial (seed) data
events_table = DB.from(:events)

events_table.insert(title: "Chicago Spring Half Marathon", 
                    description: "More than 4,000 runners and walkers crossed the finish line in both races combined last year at the Chicago Spring Half Marathon & 10K, which is part of the Chicagoland Half Marathon Series.",
                    date: "May 17",
                    location: "Chicago, IL",
                    image: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/abd79f13739035.5627779c097ce.jpg")

events_table.insert(title: "Grandma's Half Marathon", 
                    description: "The crystal blue waters of Lake Superior form the backdrop for your run along the entire race route of the Grandma’s Half Marathon.",
                    date: "June 20",
                    location: "Duluth, MN",
                    image: "https://r-cf.bstatic.com/images/hotel/max1024x768/164/164379627.jpg")

events_table.insert(title: "Chicago Fall Half Marathon", 
                    description: "Join thousands of fellow runners at one of the nation’s premier half marathon road race events, the Chicago Half Marathon & Life Time 5K that takes place each September here in what’s famously known as the Windy City.",
                    date: "September 27",
                    location: "Chicago, IL",
                    image: "https://i.imgur.com/bQ68jJq.jpg")
