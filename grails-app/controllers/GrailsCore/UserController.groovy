package GrailsCore

import com.org.grailscore.DataTableDto
import grails.converters.JSON

class UserController {

    UserService userService

    BookService bookService

    def login() {
    }

    def validateUser(){
        if(params.email != null && params.password != null) {
            def response = userService.authenticateUser(params)
            if(response.condition){
                redirect(action: "home",id: response.id)
            }
            else{
                redirect action: "login"
            }
        }
        else{
            redirect action: "login"
        }
    }

    def home(Integer id) {
//        def response = bookService.showByUser(params.id)
        [userId: id]
    }

    def saveUser() {
        def response = userService.create(params)
        redirect action: "login"
    }

    def registerUser(){
        String template = userService.signup()
        def map = [form: template]
        render map as JSON
    }

    def editUser(){
        String template = userService.read(params.id)
        def map = [form: template,uniqueId: "editUser"]
        render map as JSON
    }

    def updateUser(params) {
        def user = userService.update(params)
        redirect (action: "home",id: params.id)
    }

    def deleteUser() {
        userService.delete(params)
        redirect action: "home"
    }
}