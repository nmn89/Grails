package GrailsCore


import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

import javax.validation.constraints.Null

@Transactional
class UserService{

    def groovyPageRenderer

    def create(GrailsParameterMap params){
        User user = new User(params)
        if(user.validate()){
            user.save(flush: true)
        }
        else{
            user.errors.allErrors.each {
                println it
            }
        }
        return user
    }

    def update(GrailsParameterMap params){
        def user = User.get(params.id)
        user.properties = params
        if(user.validate()){
            user.save(flush: true)
        }
        else{
            user.errors.allErrors.each {
                println it
            }
        }
        return user
    }

    def authenticateUser(GrailsParameterMap params) {
        def user = User.findByEmailAndPassword(params.email,params.password)
        boolean condition = false
        if(user!= null){
            condition = true
            return [condition: condition,id: user.id]
        }
        return [condition: condition]
    }

    def read(Serializable id){
        def user = User.get(id)
        String template = groovyPageRenderer.render(template: "/user/update",model: [user: user])
        return template
    }

    def signup(){
        String template = groovyPageRenderer.render(template: "/user/create")
        return template
    }

    def show(){
        List<User> userList = User.getAll()
        return [list:userList,count:User.count()]
    }

    def delete(GrailsParameterMap params){
        def user = User.get(params.id)
        user.delete(flush: true)
    }

}