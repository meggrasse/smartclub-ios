# SmartClub - iOS

This is the iOS module of the SmartClub project. This app collects both active voting data via the app interface, and passive
location data using iBeacons to determine if the crowd likes the currently playing song. This data is sent to the
server, currently hosted at https://smartclub.herokuapp.com.

The master repo for this project is located at https://github.com/meggrasse/smartclub.

## Requirements

Estimote beacon & Estimote account

## Setup

Update *-(BOOL)application:didFinishLaunchingWithOptions* in AppDelegate.m with your
appropriate Estimote Beaocn UUID, major, minor, and identifier which can be found at https://cloud.estimote.com/.

Update your server URL in *-(void)sendDataTo:endpoint* in AppDelegate.m

## Usage

Manual upvotes and downvotes submitted via the app's interface will be sent to your server. 
Crowd migration towards and away from the stage (Beacon) will trigger upvote and downvote events as well. Users must have
the app installed.
    
