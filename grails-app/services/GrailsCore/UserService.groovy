package GrailsCore


import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import java.util.Base64

@Transactional
class UserService{

    def groovyPageRenderer

    def create(GrailsParameterMap params){
        params.password = encodePassword(params.password)
        User newUser = new User(params)
        if(newUser.validate()){
            newUser.save(flush: true)
            return newUser
        }
        else{
            newUser.errors.allErrors.each {
                println it
            }
            return null
        }
    }

    def update(GrailsParameterMap params){
        def user = User.get(params.id)
        params.password = encodePassword(params.password)
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
        params.password = encodePassword(params.password)
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

    def encodePassword(String password){
        String encodedText = Base64.getEncoder().encodeToString(password.getBytes("UTF-8"))
        return encodedText
    }

    def decodePassword(String encodeText){
        byte[] decodeArr = Base64.getDecoder().decode(encodeText)
        String decodeText = new String(decodeArr,"UTF-8")
        return decodeText
    }
}