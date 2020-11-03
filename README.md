* Original App Design Project - README Template
===

# Pin It!

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Scheme)

## Overview
### Description
App that lets you define a specific location as either Red(republican) or Blue(Democrat). The total results are displayed on an Apple Map to visualize Political preferance density.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Informational
- **Mobile:** Will start off for IOS and then expand to android devices and desktop. Mobile will be more interactive, desktop will show general data and posts
- **Story:** Analyzes how many people are publically displaying their support for political candidates via putting up signs. The data will appear on maps and in different forms of data. 
- **Market:** Any indidual, young adult and adults, can use the app and update it whenever needed. 
- **Habit:** Can be used as many times as needed. Will be more active during election seasons 
- **Scope:** Allows people to see what political party/candiates the community supports the most by showing what political signs are most popular. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users need to beable to pin location as red or Blue
* Users must Register and Login to the system
* Visualize map with user defined pins (Red/Blue)
* System must ask users to allow location services

**Optional Nice-to-have Stories**

* Users are able to friends and see/ comment on their pins
* Have a tab to link to additional voter information.

### 2. Screen Archetypes

* Login Screen
   * Users must Register and Login to the system
   * System must ask users to allow location services
* Pin Dropper
   * Users need to beable to pin location as red or Blue
   * ...
* Map Viewer
   * Users need to beable to pin location as red or Blue
   * Visualize map with user defined pins (Red/Blue)
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Main dashboard shows other people's pins / interact with others
* Map showing pins 
* Data
* Settings


Optional:



**Flow Navigation** (Screen to Screen)

* Forced log-in/signup 
   * asks for location upon login 
* Shows user's dashboard
   * updates most recent pins 
   * user can sort pins i.e hottest or newest
* Map - > updates to show new pins and shows map of pins within a certain radius

* Data -> updates data visualization as map updates
    * organizes data effectively showing, showing different types of data. i.e number of blue or red pins in your community, city, state. 

* Settings
    * users can update personal info
    * read TOS 
    * log out 


 


## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="http://g.recordit.co/WsqurFTzL6.gif" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models

Model: Social View


| Property | Type     | Description          |
| -------- | -------- |:-------------------- |
|          |          |                      
| -------- | -------- | --------             |
| objectId | String   | id for the user post
|author    |Pointer to user|Image of author
|caption   | String|Image caption by user
|likesCount| Number|Number of likes for the post
|commentsCount|Number|Number of comments
|createdAt| DateTime|Date when post is created
|map| File| Map that updates when user uploads

Model: Pin it/Map view



| Property | Type | Description |
| -------- | -------- | -------- |
| Pin it     | File     | Button that allows user to post     |
|Search| File|Button that allows user to search different locations

Model: Data

| Property |Type| Description|
| -------- | -------- | -------- |
| image     | File     | Turns data from maps into infographics     |

Model: Settings


| Property | Type | Description |
| -------- | -------- | -------- |
| image     | File     | Displays user profile pic/avatar     |
|editProfile|String| Allows user to edit profile
|privacy|String|Shows privacy settings
|notificatons|String|Shows user notification settings
|about|String|Shows info about the app 
|logOut|String|Allows user to logout




### Networking

* Social view
    * (Read/Get) Query all posts where user is author
    * (Create/Post) Create a new like
    * (Delete) Delete existing like
    * (Create/Post) Create a new comment on a post
    * (Delete) Delete existing comment
    * (Read/Get) Fetch map of uploaded user's pins
    
* Pin it
    * (Create/Post) Create a new post object
    * (Read/Get) Fetch pins from across the US

* Data
    * (Read/Get) Fetch pins and turn them into digestable inforgraphics for user

* Settings
    * (Read/Get) profile picture
    * (Update/Put) edit profile






    

