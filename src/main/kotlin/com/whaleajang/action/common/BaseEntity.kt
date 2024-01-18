package com.whaleajang.action.common

import jakarta.persistence.Column
import jakarta.persistence.EntityListeners
import jakarta.persistence.MappedSuperclass
import org.springframework.data.annotation.CreatedDate
import org.springframework.data.annotation.LastModifiedDate
import org.springframework.data.jpa.domain.support.AuditingEntityListener
import java.time.LocalDateTime

@MappedSuperclass
@EntityListeners(AuditingEntityListener::class)
abstract class BaseEntity {

    @CreatedDate
    @Column(updatable = false, nullable = false)
    private var createdDate: LocalDateTime = LocalDateTime.MIN

    @LastModifiedDate
    @Column(nullable = false)
    private var modifiedDate: LocalDateTime = LocalDateTime.MIN
}