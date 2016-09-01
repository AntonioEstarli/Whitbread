# Whitbread Product Developer Test

## Instructions to build the project

* **Cocoapods**

You need https://cocoapods.org to build the code. 

If you don’t have it installed, go to a terminal window and insert the following command:

sudo gem install cocoapods

Please be patient, it can take a while to install cocoa pods.

* **das-quadrat**

https://github.com/Constantine-Fry/das-quadrat
Das-Quadrant is a Swift wrapper for Foursquare API. To install it, you’ll use cocoa pods.

1) Open Terminal
2) Type cd (c-d-space)
3) Open Finder
4) Locate your project root directory in Finder, but don’t go into it.
5) Drag-and-drop the project directory from Finder to Terminal.
6) Most likely, the absolute path will now appear next to cd.
7) Press the enter key

You’ve now cd-ed into the right directory!

In Terminal, now type this:

pod install

Again, be patient and ultimately the framework will be installed.

* **workspace**

Find your .xcworkspace file in Finder and open it in order to build and run the project.

If you have any problems, please contact antonio.estarli@gmail.com

## Included libraries

* **das-quadrat**

Members of the Foursquare API community have been nice enough to release libraries for integrating with the foursquare. 

If you check https://developer.foursquare.com/resources/libraries you’ll see that das-quadrat is used in Swift. It is a very good Foursquare wrapper, that’s the reason I am using it. 

https://github.com/Constantine-Fry/das-quadrat


## Approach taken

* Model

I use the struct Venue as the model for venues returned by Foursquare. 
I keep it simple, just have the name and address of the venue.

* Parser

To parse the JSON returned by Foursquare, I created a utility class called VenueParser, which abstract the process and keeps it isolated in one class with just a single purpose. This is better for maintainability, extensibility and unit testing.

I could have used a third party framework in order to parse the JSON, like SwiftyJSON , but I wanted to include as few third party framework as possible. Besides, the code is quite simple for this example.

* FoursquareManager

I created this utility class as an interface for all communications with Foursquare, isolating the complexity of the process and leaving a clean and simple interface for the clients wanting to use it.

It is a Singleton, as it can be used in many parts of the code to connect to an external resource.

It only has a function to get the venues of a place, with a completion handler, because it is asynchronous. This function cancels any previous searches and contact with Foursquare to retrieve a response, which is parsed into an array of venues and then passed back in the completion handler.

* VenueListDataProvider

I created this class in order to decouple the datasource and delegate from the ViewController, leaving the ViewController much cleaner.

In this case, we only need the datasource. I store and array of Venues that are shown every time the user searches for some place, and implement the needed datasource methods.

* ViewController

This class is simple, it has a dataProvider property of the type VenueListDataProvider and a tap gesture to remove the keyboard when tapped outside it.

It has an extension to implement UISearchBarDelegate, which uses FoursquareManager to update the data and reload the table view.



 
