package com.org.grailscore

class DataTableDto<T> {

    T data
    Integer orderColumnIndex = 0
    Integer total = 0
    Integer filteredTotal = 0
    String direction = 'asc'
}
