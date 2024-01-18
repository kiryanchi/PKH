package com.whaleajang.action.common

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class CommonController {

    @GetMapping
    fun healthCheck(): String = "UP"
}