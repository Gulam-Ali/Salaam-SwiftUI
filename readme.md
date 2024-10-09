
# SwiftUI Login Functionality

This project demonstrates a simple login functionality written in SwiftUI. Although relatively simple, the project focuses on implementing essential yet powerful concepts in iOS app development.

## Features

- **Login Form**: A basic login interface with username and password fields.
- **State Management**: Uses SwiftUI’s `@State`, `@StateObject`, `@ObservedObject`, and `@Published` to handle data flow efficiently.

## Key Concepts Implemented

1. **Project Navigation Best Practices**:  
   Demonstrates clean project structure and navigation practices to ensure easy maintenance and scalability.

2. **Custom Modifiers**:  
   Simplifies the code by creating reusable view modifiers for consistency across UI components.

3. **Navigation Flow**:  
   Properly handles screen transitions and user flow using SwiftUI’s `NavigationStack` and `NavigationLink`.

4. **Data Flow**:  
   Utilizes SwiftUI’s declarative data flow architecture:
   - `@State`
   - `@StateObject`
   - `@ObservedObject`
   - `@Published`
   Each is used to manage state effectively between views and the ViewModel.

5. **MVVM Architecture**:  
   The project is structured using the **Model-View-ViewModel (MVVM)** pattern to separate concerns and improve testability and scalability.

6. **Dependency Injection**:  
   Dependencies such as services are injected into the ViewModel to improve testability and flexibility.

7. **@AppStorage for User Data**:  
   User details are securely stored using `@AppStorage`, which leverages UserDefaults under the hood to persist data across app launches.


