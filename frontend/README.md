# TAPP frontend

This Flutter project is the frontend for the TAPP app.

## Project Structure

### Folder Structure

- __data__  
  Contains api calls, local storage and models belonging to this
    - __data/provider__  
      Contains api calls and local storages
    - __data/models__  
      Contains model for the api request and responses


- __domain__

    - __domain/service__  
      Contains services which are used to manage the data
    - __domain/model__  
      Contains models used in the application
    - __domain/features__  
      Contains functionality to change data


- __ui__  
  Contains everything for the user interface
    - __ui/navigation__  
      Contains the route definitions, route guards and bindings
    - __ui/controller__  
      Contains the controller for the screen
    - __ui/screen__  
      Contains the screens
    - __ui/widget__  
      Contains widgets which are used on multiple screens

#### Data flow
![Data flow](../../data_flow.png "Data flow")



## Used packages


### get
https://pub.dev/packages/get  
Version: ^4.6.5  

Get is used for state management and navigation

### flutter_secure_storage
https://pub.dev/packages/flutter_secure_storage  
Version: ^6.0.0  

Used to store local data encrypted.

### shared_preferences
https://pub.dev/packages/shared_preferences   
Version: ^2.0.15  

Used to store local data which are not needed to be encrypted.

### shimmer
https://pub.dev/packages/shimmer  
Version: ^2.0.0

Used for the loading shimmer animation.

### image_picker
https://pub.dev/packages/image_picker  
Version: ^0.8.7+5

Used to select images from the gallery or take images.
