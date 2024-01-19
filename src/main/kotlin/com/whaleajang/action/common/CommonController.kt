package com.whaleajang.action.common

import org.springframework.beans.factory.annotation.Value
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class CommonController {

    @GetMapping("/health")
    fun healthCheck(): String = "UP"

    @GetMapping("/version")
    fun versionCheck(@Value("\${Version}") version: String): String = version
}