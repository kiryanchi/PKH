package com.whaleajang.action.user.controller

import com.whaleajang.action.user.dto.request.CreateUserDto
import com.whaleajang.action.user.dto.response.ResponseUserDto
import com.whaleajang.action.user.service.UserService
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/user")
class UserController (
    private val userService: UserService
) {

    @PostMapping
    fun createUser(@RequestBody createUserDto: CreateUserDto): ResponseEntity<ResponseUserDto> {
        return userService.createUser(createUserDto)
            .let {
                ResponseEntity.ok()
                    .body(
                        ResponseUserDto(
                            name = it.name,
                            age = it.age,
                        )
                    )
            }
    }

    @GetMapping
    fun fetchUser(userId: Long): ResponseEntity<ResponseUserDto> {
        return userService.fetchUser(userId)
            .let {
                ResponseEntity.ok()
                    .body(
                        ResponseUserDto(
                            name = it.name,
                            age = it.age,
                        )
                    )
            }
    }
}