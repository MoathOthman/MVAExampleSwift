

In the next step we kindly ask you to solve following task in advance:



At http://www.codetalk.de/cars.json you get a JSON list of cars with some basic information
Implement an app, that downloads this file and use all information available that you think makes sense to display
Displays these cars in a list
Displays these cars on a map
Note: The carImageUrl is not up to date anymore, therefore, you can get the correct URL to the car image using this pattern:
https://prod.drive-now-content.com/fileadmin/user_upload_global/assets/cars/{modelIdentifier}/{color}/2x/car.png
In case there are still images missing, use a fallback
You may use any external frameworks / libraries you like, just add a short note why you chose this one and what you use it for
Please do not use any Rx/Reactive
Please use Swift with the latest devtools
Focus more on architecture, structure & clean code, less on design


1.  fetch results from json 
2.  parse them
3.  have a view with 2 buttons map and list
4.  cell contains name, modelName, and image carImageUrl
5.  draw pins on the map when user taps first time on map button
6.  by default show the list 
7.  a pin on a map should have a callout with the car picture on it 

# Archeticure 
MVP
* Wire frame to assemble the stack
* sets of protocol that define the stack
* View controller 
* Cell view 
* presenter for the view controller and one for the cell 

API for fetching the json 
Models to represent the data plus parsing 

# Dependencies
### Object mapper 
mapping from json to objects
### Toast-Swift
loading indicator 
### SDWebImage
Fetch and cache images 

#### Snapkit 
for autolayout 

#### Mockingjay
for stubbing api request 
#### Nimble
provides matchers for testing 


