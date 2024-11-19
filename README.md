# Insight Users App

This is the **Insight Users App**, an application that allows users to view and filter user information using a search box. The app is designed with robust state management and includes features for enhanced user interaction like profile viewing and swipe-to-refresh.

## Features

- **User List with Search**: View a list of users and filter them with an integrated search box.
- **Profile Page**: Click on a user from the list to view detailed information on a dedicated profile page.
- **Swipe-to-Refresh**: Refresh the user list by swiping down.
- **API Integration**: Powered by `resclient` for seamless API handling.
- **Logging**: Uses `Dio` for interceptors and logging API calls.

## Tech Stack

- **State Management**: Implemented with the BLoC (Business Logic Component) pattern for efficient state management.
- **Dependency Injection**: Utilized `get_it` for creating singletons and dependency management.
- **Networking**: 
  - `resclient` for API integration.
  - Custom interceptors for logging and token management using `Dio`.
- **UI/UX Enhancements**: 
  - Modular UI components for reusability.
  - Built-in swipe-to-refresh and search functionality.
- **Others**:
  - Configuration support via build variants.
  - Session management and logging utilities.

## Directory Structure

```plaintext
.
├── api
│   ├── client
│   │   ├── api_client.dart
│   │   ├── rest_client.dart
│   │   └── rest_client.g.dart
│   └── tool
│       ├── build_variant_def.dart
│       ├── logging_interceptor.dart
│       └── token_interceptor.dart
├── build
│   ├── build_tools.dart
│   ├── build_variant_def.dart
│   ├── splash_screen.dart
│   ├── buildDelegates
│   │   └── app_configs.dart
│   └── web
│       └── web_version_info.dart
├── constants
│   ├── api_endpoints.dart
│   └── global_variables.dart
├── model
│   └── users_info.dart
├── navigation
│   ├── app_router.dart
│   └── my_routes.dart
├── pages
│   ├── home
│   │   ├── bloc
│   │   │   ├── home_page_bloc.dart
│   │   │   ├── home_page_event.dart
│   │   │   └── home_page_state.dart
│   │   └── ui
│   │       ├── home_page.dart
│   │       ├── search_box.dart
│   │       └── user_card.dart
│   └── profile
│       └── ui
│           └── profile_page.dart
├── theme
│   └── my_text_styles.dart
└── utils
    ├── app_utils.dart
    ├── log.dart
    ├── session_manager.dart
    └── user_session_handler.dart
