# community_app

A Social Media platform

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


## Folder Structure
The application is structured in the following way (eventually):

```
-   lib/        - Root Application in Flutter
    -   bloc/       - Business Logic for the apps Local State.
    -   models/     - Application Models
    -   redux/      - Redux Configuration and Global State Management
        -   actions/            - Redux Actions for the application. These actions are dispatched to the store
        -   middleware/         - Middleware that runs during action dispatching
        -   reducers/           - Redux reducers that update the store depending on the action
        -   state/              - Redux store(s) for the application. 
    -   vendor/     - Vendor Configuration for the App
    -   view/       - All UI elements of the application
        -   components/         - Custom Widget Components
        -   screens/            - Application Screens/Pages
```