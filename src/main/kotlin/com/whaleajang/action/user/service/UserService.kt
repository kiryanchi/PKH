package com.whaleajang.action.user.service

import com.whaleajang.action.user.User
import com.whaleajang.action.user.dto.request.CreateUserDto
import com.whaleajang.action.user.repository.UserRepository
import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service

@Service
class UserService(
    private val userRepository: UserRepository
) {

    fun createUser(createUserDto: CreateUserDto): User {
        return User(
            name = createUserDto.name,
            age = createUserDto.age,
        ).let {
            userRepository.save(it)
        }
    }

    fun fetchUser(userId: Long): User {
        return userRepository.findByIdOrNull(userId)
            ?: throw IllegalArgumentException("잘못된 User Id 입니다.")
    }
}