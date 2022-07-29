package GrailsCore

class Book {

    static belongsTo = [user: User]
    Integer id
    String authorName
    String bookName
    String date
    String language

    static constraints = {
        id size:1..5, blank: false, unique: true
        authorName size: 5..25, blank: false
        bookName size: 5..50, blank: false
        date size: 1..10, blank: false
        language size: 5..15, blank: false
    }

    static mapping = {
        table 'Book'

        version false
        id column: 'BookId'
        authorName column: 'AuthorName'
        bookName column: 'BookName'
        date column: 'Date'
        language column: 'Language'
    }
}
