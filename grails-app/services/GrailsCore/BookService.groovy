package GrailsCore

import grails.transaction.Transactional
import com.org.grailscore.DataTableDto
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class BookService {

    def groovyPageRenderer

    def create(GrailsParameterMap params){
        if(params.bookName!=null && params.authorName!=null){
            def book = Book.findByBookNameAndAuthorName(params.bookName,params.authorName);
            if(book){
                return null
            }
            else{
                Book newBook = new Book(params)
                if(newBook.validate()){
                    newBook.save(flush: true)
                    return newBook
                }
                else{
                    newBook.errors.allErrors.each {
                        println it
                        return null
                    }
                }
            }
        }
    }

    def update(GrailsParameterMap params){
        def book = Book.get(params.id)
        book.properties = params
        if(book.validate()){
            book.save(flush: true)
        }
        else{
            book.errors.allErrors.each {
                println it
            }
        }
        return book
    }

    def read(int id){
        def book = Book.get(id)
        String template = groovyPageRenderer.render(template: "/book/updateBook",model: [book:book])
        return template
    }

    def show(){
        List<Book> bookList = Book.getAll()
        return [list:bookList,count:Book.count()]
    }

    def delete(int id){
        def book = Book.get(id)
        book.delete(flush: true)
    }

    def addBook(Serializable id){
        String template = groovyPageRenderer.render(template: '/book/addBook',model: [id: id])
        return template
    }

    DataTableDto<List<List<String>>> showByUser(def id){
        User user = User.findById(id)
        List<Book> books = Book.findAllByUser(user)
        List<List<String>> bookResponse = []
        books.eachWithIndex{ book, index ->
            List<String> Data = []
            Data << book.bookName
            Data << book.authorName
            Data << book.language
            Data << book.id
            bookResponse << Data
            Data = []
        }
        return new DataTableDto<List<List<String>>>(data: bookResponse)
    }
}