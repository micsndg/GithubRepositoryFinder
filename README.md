# GitHub Repository Finder

A GitHub repository explorer built with **SwiftUI**, showcasing modern iOS development practices, clean architecture, and asynchronous networking.

The application allows users to search for GitHub repositories, view detailed repository information, and explore data retrieved from the GitHub REST API.

> 🚧 **Work in Progress**
>
> This project is actively being developed. Additional features and improvements will continue to be added.

---

## Feature Checklist

### Core Features

- [x] Search GitHub repositories
- [x] Display repository list
- [x] Pull-to-refresh
- [x] Loading state
- [x] Empty state
- [x] Error state

### Repository Details

- [x] Repository detail screen
- [x] Owner information
- [x] Repository statistics
- [x] Open repository in GitHub

### Planned Features

- [ ] Favorites
- [ ] Pagination (Infinite Scrolling)
- [ ] Repository filtering
- [ ] Recent searches
- [ ] Repository sharing
- [ ] Offline caching
- [ ] Unit Tests
- [ ] UI Tests

---

## Tech Stack

- Swift
- SwiftUI
- Swift Concurrency (`async/await`)
- MVVM Architecture
- Repository Pattern
- Dependency Injection
- GitHub REST API

---

## Architecture

The project follows a modular architecture with clear separation of responsibilities.

```
View
    ↓
ViewModel
    ↓
Repository
    ↓
Service
    ↓
APIClient
```

```
GitHubExplorer
├── App
├── Core
│   ├── Networking
│   └── Utilities
├── Modules
│   ├── Shared
│   ├── Search
│   ├── RepositoryDetail
│   └── Favorites (WIP)
├── Resources
└── Tests
```

---

## Project Goals

This project aims to demonstrate:

- Modern SwiftUI development
- Modular application architecture
- Clean and maintainable code
- Networking with the GitHub REST API
- Dependency Injection
- Repository Pattern
- State management using SwiftUI
- Scalable project structure

---

## Screenshots

### Search

<img width="301" height="655" alt="Search Screen" src="https://github.com/user-attachments/assets/322e7bce-b0fb-4fdf-83a4-5b466922f927" />

### Repository Details

<img width="301" height="655" alt="Repository Detail Screen" src="https://github.com/user-attachments/assets/38ae49a7-f0c3-4af1-8dd9-a53fe5820a61" />

---

## Requirements

- Xcode 16+
- iOS 18+
- Swift 6

---

## License

This project was created for learning, portfolio, and demonstration purposes.
