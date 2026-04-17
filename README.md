# CyberSapient iOS Task

![Swift](https://img.shields.io/badge/Swift-5.0-FA7343?style=flat-square&logo=swift&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-iOS-000000?style=flat-square&logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-15%2B-147EFB?style=flat-square&logo=xcode&logoColor=white)
![Pattern](https://img.shields.io/badge/Pattern-MVVM-7C3AED?style=flat-square)

An iOS technical assignment project built in **Swift**, demonstrating clean code practices, structured architecture, and real-world iOS development patterns.

---

## About the Project

This project was developed as a technical assessment, showcasing practical iOS engineering skills including:

- Structured project organisation following **MVVM** architecture
- Clean, readable Swift code with clear separation of concerns
- REST API integration with proper error handling
- Responsive UI built with **UIKit**
- Data management and state handling

---

## Features

- REST API integration with `URLSession`
- MVVM architecture with clear ViewModel–ViewController separation
- Clean error handling and loading state management
- Responsive UIKit-based UI
- Protocol-oriented design for testability

---

## Tech Stack

| Technology | Usage |
|---|---|
| Swift 5 | Primary language |
| UIKit | UI layer |
| URLSession | Networking / REST API |
| MVVM | Architectural pattern |
| Git | Version control |

---

## Getting Started

### Requirements
- Xcode 15+
- iOS 15+
- Swift 5.0+

### Run the project

```bash
git clone https://github.com/Ron-gahlot/CyberSapientTask.git
cd CyberSapientTask
open CyberSapient/CyberSapient.xcodeproj
```

Build and run with `Cmd + R` in Xcode.

---

## Code Highlights

### Clean ViewModel pattern
ViewModels handle all business logic and expose data via closures or Combine publishers — ViewControllers only handle UI updates.

### Protocol-based networking
The network layer is abstracted behind a protocol, making it easy to swap real API calls with mock data for testing.

### Structured error handling
Network errors, decoding failures, and empty states are all handled explicitly — no silent failures.

---

## Author

**Rahul Kumar Gahlot** — Senior iOS Engineer with 9+ years of experience building consumer-scale apps across healthcare, OTT, retail, and utility domains.

[![GitHub](https://img.shields.io/badge/GitHub-Ron--gahlot-181717?style=flat-square&logo=github)](https://github.com/Ron-gahlot)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Rahul%20Gahlot-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rahul-gahlot)
