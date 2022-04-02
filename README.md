# flutter_getx_boilerplate

This project is a sample for flutter MVVM pattern. (use getx)

##  Features

- mvvm pattern
- signin/signout sample. (include remember me, auto sign in)
- http: rest api

<br>

## File Structure
    ├── app                 
        ├── theme
        ├── util
        routes.dart
    ├── binding             
    ├── controller          
    ├── data
        ├── model           
        ├── repository      
        ├── service        
    ├── ui
        ├── screen          
        ├── style           
        ├── widget          
    main.dart

<br>

## Screenshot
![screenshot](https://user-images.githubusercontent.com/26052559/161377588-2bb9f3fa-0ba5-42f6-a387-3950b91c177e.png)

<br>

##  Architecture(MVVM)
![architecture](https://user-images.githubusercontent.com/26052559/161376871-084f0c23-be44-4a45-b627-f36db9fd5a08.png)

<br>

## Getting Started
  1. Clone this repository
```sh
    git clone https://github.com/madsys11/flutter_getx_boilerplate.git
```
  2. Rename folder `flutter_getx_boilerplate` to your project name.
  3. You can use the [rename](https://pub.dev/packages/rename) plugin to change projectName and packageName.  
```sh
    flutter pub global activate rename
    flutter pub global run rename --appname "projectName"
    flutter pub global run rename --bundleId com.xxx.packageName
```
  4. Open the project. (e.g., vscode)
  5. Use the `command+shift+h`(on mac) command to replace all `flutter_getx_boilerplate` to `projectName`.
  6. Get packages in a Flutter project.
```sh
    flutter pub get
```