# Library Management System in Swift

A simple **Library Management System** built in Swift using **protocols**, **extensions**, **inheritance**, **optional handling**, and **error management**.

## Project Overview

This project models a small library system where books can be added, borrowed, and returned.  
It was designed to practice key Swift concepts such as:

- Protocol-oriented programming
- Class inheritance
- Default protocol implementations via extensions
- Error handling with `throws`
- Safe optional handling
- Type checking and protocol conformance

## Main Features

- `Item` class as the base model for library items
- `Book` subclass conforming to the `Borrowable` protocol
- `Borrowable` protocol with borrowing metadata:
  - `borrowDate`
  - `returnDate`
  - `isBorrowed`
- Default protocol behavior:
  - `isOverdue()`
  - `checkIn()`
- `LibraryError` enum for controlled error handling
- `Library` class to store and manage items by ID
- Borrowing logic with safe checks for:
  - missing items
  - non-borrowable items
  - already borrowed items

## Concepts Demonstrated

This repository shows understanding of:

- Protocols and protocol extensions
- Inheritance and class design
- Optional handling
- Error propagation with `throws`
- Safe type casting
- Basic object-oriented modeling in Swift

## File Structure

- `main.swift` — contains the full implementation of the system

## How It Works

1. A `Book` is created and added to the `Library`.
2. The library stores items by their unique ID.
3. When borrowing an item, the system checks:
   - if the item exists
   - if it conforms to `Borrowable`
   - if it is already borrowed
4. If valid, the borrowing date and return date are assigned automatically.

## Why This Project Matters

This exercise demonstrates practical Swift fundamentals and clean code organization.  
It is a good example of:

- modeling real-world problems with classes and protocols
- writing safe code with error handling
- using Swift’s type system to avoid runtime crashes

## Notes

This project is intentionally kept simple to focus on Swift language features and system design fundamentals.

---

Created as part of an iOS Swift specialization exercise.
