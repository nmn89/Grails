package GrailsCore

import grails.converters.JSON

class UserController {

    UserService userService

    def login() {
    }

    def validateUser(){
        if(params.email != null && params.password != null) {
            def response = userService.authenticateUser(params)
            if(response.condition){
                redirect(action: "home",id: response.id)
            }
            else{
                render(view: "login",model: [message: "wrong email or password"])
            }
        }
        else{
            redirect action: "login"
        }
    }

    def home(Integer id) {
        [userId: id]
    }

    def index(Integer id){
        String message = "OOPS! Record already exists"
        render(view: "home",model: [userId: id,msg: message])
    }

    def saveUser() {
        def response = userService.create(params)
        if(response){
            redirect action: "login"
        }
        else{
            render(view: "login",model: [message: "Email already exists"])
        }
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