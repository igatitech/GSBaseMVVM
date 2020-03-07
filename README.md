[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/igatitech/GSBaseMVVM/blob/master/LICENSE) 
![Swift: 5.0.x](https://img.shields.io/badge/Swift-5.0.x-orange)

# GSBaseMVVM
**GSBaseMVVM is a base project which follows MVVM(Model-View-ViewModel) coding pattern.**

## What is MVVM?

###### The Model-View-ViewModel concept describes 3 components:
- Model: a wrapper of data
- View: a representation of a user interface (UI), it is a combination of view & viewcontroller
- ViewModel: an intermediary between the Model and the View

![alt text](https://github.com/igatitech/GSBaseMVVM/blob/master/Resources/MVVM.jpg)

###### How the messages can flow from one component to the other:
- The View/view controller presents Model data to the user 
- The View/view controller does not talk directly to the Model. The View/view controller can only talk to the Model indirectly through the ViewModel.
- The ViewModel is the intermediary between the View/view controller and Model.


## Why to use MVVM?
- MVVM provides better Encapsulation
- Improved Testability
- Debugging becomes easier
- Easier to create unit tests as the main business logic would be written in the ViewModel only
- Reduce overhead of viewcontroller

## Key Features:
- Basic MVVM Architecture
- Simple TableView
- API Calling Structure

## How to run the project?

- Make sure you have an active internet connection and connected with a Physical device or you can use Xcode Simulator too.
- download or clone the project
- Open the terminal
- cd (project_path)
- pod install
- Open .xcworkspace file from your project folder
- Run the project from Xcode

## Ackowledgement

This project has used other third party libraries available on GitHub as mentioned below:

- [Alamofire](https://github.com/Alamofire/Alamofire)
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)

**Happy Coding! Cheers!!** 🥂 

## How to Contribute?

Have an idea? Found a bug? See [how to contribute](https://github.com/igatitech/GSBaseMVVM/blob/master/CONTRIBUTION.md). Every small or large contribution to this project is appreciated.

## Author
You can find more about me here : [Gati Shah](https://igati.tech)

If you wish to contact me, 
Email at: [connect@igati.tech](connect@igati.tech)

Reach me on: [LinkedIn](https://www.linkedin.com/in/igatitech/)

## License
Copyright 2020 iGatiTech

This project is distributed under the terms & conditions of [MIT License](https://github.com/igatitech/GSBaseMVVM/blob/master/LICENSE).
