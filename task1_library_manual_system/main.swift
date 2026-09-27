//
//  main.swift
//  task1_library_manual_system
//
//  Created by Erik Valencia Cardona on 24/09/26.
//

import Foundation

enum LibraryError: Error {
    case itemNotFound
    case itemNotBorrowable
    case alreadyBorrowed
}

protocol Borrowable {
    var borrowDate: Date? { get set }
    var returnDate: Date? { get set }
    
    var isBorrowed: Bool { get set }
    
    mutating func checkIn()
}

extension Borrowable {
    func isOverdue() -> Bool {
        guard let returnDate else { return false }
        return returnDate < Date()
    }
    
    mutating func checkIn() {
        borrowDate = nil
        returnDate = nil
        isBorrowed = false
    }
}


class Item {
    let id: String
    let title: String
    let author: String
    
    init (id: String, title: String, author: String ) {
        self.id = id
        self.title = title
        self.author = author
    }
}
    
class Book: Item, Borrowable {
    var borrowDate: Date?
    var returnDate: Date?
    
    var isBorrowed: Bool

    init(id: String, title: String, author: String, borrowDate: Date?, returnDate: Date?, isBorrowed: Bool){
        self.borrowDate = borrowDate
        self.returnDate = returnDate
        self.isBorrowed = isBorrowed
        
        super.init(id: id, title: title, author: author)
    }
    
    convenience override init(id:String, title: String, author: String){
        self.init(id: id, title: title, author: author, borrowDate: nil, returnDate: nil, isBorrowed: false)
    }
}
class Library {
    var books: [String: Item] = [:]
    
    func addBook(_ book: Book) {
        books[book.id] = book
    }
    
    func borrowItem(by id: String) throws -> Item {
        guard let item = books[id] else {
            throw LibraryError.itemNotFound
        }
        
        guard var borrowableItem = item as? Borrowable else {
            throw LibraryError.itemNotBorrowable
        }
        
        if borrowableItem.isBorrowed {
            throw LibraryError.alreadyBorrowed
        }
        
        borrowableItem.borrowDate = Date()
        borrowableItem.returnDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
        borrowableItem.isBorrowed = true
        
        return item
    }
}


/// Example
///
let library = Library()

let book1 = Book(id: "1", title: "1984", author: "George Orwell")
library.addBook(book1)

do {
    let borrowed = try library.borrowItem(by: "1")
    print("Borrowed: \(borrowed.title)")
} catch {
    print("Error: \(error)")
}

do {
    let borrowed = try library.borrowItem(by: "999")
    print("Borrowed: \(borrowed.title)")
} catch {
    print("Error: \(error)")
}
