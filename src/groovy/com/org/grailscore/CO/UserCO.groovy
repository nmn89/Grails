package com.org.grailscore.CO

import GrailsCore.Book
import grails.validation.Validateable

@Validateable
class UserCO {

    String name
    String age
    String email
    String password
}
