package GrailsCore

class User{
        Integer id
        String name
        String age
        String email
        String password

    static hasMany = [book: Book]

    static constraints = {
        id size:1..5, blank: false, unique: true
        name size: 5..25, blank: false
        age min: "18"
        email email: true, blank: false, unique: true
        password size:8..30, blank: false
    }

    static mapping = {
        table 'User'

        version false
        id column: 'UserId'
        name column: 'UserName'
        age column: 'UserAge'
        email column: 'UserEmail'
        password column: 'UserPassword'
    }
}