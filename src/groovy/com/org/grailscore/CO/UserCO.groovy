package com.org.grailscore.CO

import grails.validation.Validateable

@Validateable
class UserCO {

    Integer id
    String password
    String name
    String age
    String email

}
