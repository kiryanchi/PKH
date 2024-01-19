package com.whaleajang.action.user

import com.whaleajang.action.common.BaseEntity
import jakarta.persistence.*

@Entity
@Table(name = "Users")
data class User(
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long? = null,

    @Column
    val name: String,

    @Column
    val age: Int
) : BaseEntity()