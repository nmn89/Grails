package GrailsCore

import com.org.grailscore.DataTableDto
import grails.converters.JSON

class BookController {

    BookService bookService

    def addBook() {
        String template = bookService.addBook(params.id)
        def map = [form: template,uniqueId: "addBook"]
        render map as JSON
    }

    def saveBook(){
        def response = bookService.create(params)
        redirect(controller: "user",action: "home",id: params.user.id)
    }

    def deleteBook(int id){
        def userId = bookService.delete(id)
        redirect(controller: "user",action: "home",id: userId)
    }

    def showUserBooks(Integer id){
        DataTableDto<List<List<String>>> dataTableDTO = bookService.showByUser(id)
        render(contentType: 'text/json') {
            [
                    'draw'           : params.draw,
                    'recordsTotal'   : 0,
                    'recordsFiltered': 0,
                    'order'          : [[dataTableDTO.orderColumnIndex ?: 0, dataTableDTO.direction ?: 'asc']],
                    'data'           : dataTableDTO.data ?: []
            ]
        }
    }
}
