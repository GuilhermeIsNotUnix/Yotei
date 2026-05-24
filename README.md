# Yotei (予定)

<p align="center">
  <img src="lib/assets/icons/Yotei.svg" width=30% heigth=30% alt="Yotei logo, Guilherme Faura (GuilhermeIsNotUnix)">
</p>

<p align="center">Yotei logo, Guilherme Faura (GuilhermeIsNotUnix)</p>

<br>

Yotei is a cross-platform shutdown scheduler utility written in Dart, currently under active development. Yotei is developed by *Guilherme Faura (GuilhermeIsNotUnix)*.

The project aims to provide a lightweight, reliable and extensible solution for scheduling system shutdown operations across Linux, Windows and macOS environments through both CLI and future GUI interfaces.

Yotei is licensed under the Apache-2.0 License.

---

# Why the name "Yotei"?

The name **Yotei (予定)** comes from Japanese and means:

*schedule / plan / arrangement*

The name reflects the main purpose of the software: planning and automating system shutdown operations in a clean and predictable way.

---

# Project Background

Yotei is also a spiritual successor and complete rewrite of an older personal project of mine called **Gambit** (archived at: https://github.com/GuilhermeIsNotUnix/Gambit), originally written in Go.

Gambit was a simple shutdown utility focused only on Windows systems. Although functional, the project lacked proper software architecture and separation of concerns, not to mention that Gambit didn't support asynchronous operations. The GUI layer and business logic were tightly coupled, the codebase was monolithic, and the project was built before acquiring deeper knowledge in software engineering and system architecture.

Yotei was created as a new implementation designed from the ground up with:

* proper modular architecture
* separation of responsibilities
* platform abstraction
* reusable core logic
* asynchronous process execution
* scalable project organization
* cross-platform support

The project represents a significant technical advancement in terms of software engineering compared to Gambit's original codebase, and also demonstrates the author's experience and professional growth as a software engineer.

---

# Current Features

## CLI Interface

Current commands:

```bash
yotei shutdown HH:MM
yotei now
yotei cancel
yotei help
```

Examples:

```bash
yotei shutdown 23:30
```

```bash
yotei now
```

```bash
yotei cancel
```

---

# Supported Platforms

| Platform | Status                 |
| -------- | ---------------------- |
| Linux    | Functional             |
| Windows  | Functional             |
| macOS    | Needing testing        |

---

# Architecture Overview

The project is organized into independent layers with clear responsibilities.

## Execution Flow

```text
User Input
    │
    ▼
CliInterface
    │
    ▼
ShutdownManager
    ├── Parses and validates time input
    ├── Builds target DateTime
    └── Delegates execution to platform-specific services
            ├── LinuxShutdownService
            ├── WindowsShutdownService
            └── MacOSShutdownService
```

## Architectural Goals

* Decoupled platform-specific implementations
* Reusable scheduling core
* Frontend-independent business logic
* Future GUI integration through Flutter
* Maintainable and extensible structure

---

# Technical Highlights

This project demonstrates practical experience with:

## Dart Language

* asynchronous programming with `Future` and `async/await`
* process execution using `dart:io`
* platform detection
* exception handling
* modular project organization
* static utility methods
* object-oriented design
* CLI application development
* cross-platform systems programming concepts

## Software Engineering

* separation of concerns
* layered architecture
* service-oriented organization
* orchestration layer design
* platform abstraction
* parsing and validation pipelines
* reusable core services
* maintainable code structure

---

# No AI-Generated Code

Yotei is entirely handwritten and manually engineered.

No AI-generated or vibe-coded implementation was used during development.

The project was intentionally developed as a software engineering and architecture exercise focused on:

* systems programming
* Dart mastery
* project organization
* cross-platform application design

AI tools may eventually be used for documentation assistance (like the README), brainstorming or review discussions, but the implementation itself is fully authored manually.

---

# Roadmap

## Near-Term Goals

* Complete and stabilize macOS support
* Improve CLI UX and error handling
* Implement shutdown status detection
* Improve logging and diagnostics
* Add automated tests

## GUI Development

One of the next major milestones is a complete Flutter-based graphical interface.

The future Flutter frontend will become the primary user interface for Yotei while reusing the existing platform-independent core architecture.

## Long-Term Goals

* Background daemon/service mode
* Tray icon integration
* Persistent scheduling
* Localization support
* Native packaging for all supported platforms

---

# Why Dart?

Yotei also serves as an exploration of Dart outside the traditional Flutter ecosystem.

The project intentionally uses Dart as a systems-oriented language for:

* CLI tooling
* process management
* platform interaction
* asynchronous workflows
* modular application development

This demonstrates Dart's flexibility beyond mobile and UI-centric applications.

---

# License

Licensed under the Apache License 2.0.

Please read the LICENSE file carefully before using or redistributing the software.
