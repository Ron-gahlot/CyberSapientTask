//
//  UpdateTaskUseCaseTests.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 15/03/25.
//


@testable import CyberSapient
import XCTest

class UpdateTaskUseCaseTests: XCTestCase {
    var mockRepository: MockTaskRepository!
    var updateTaskUseCase: UpdateTaskCompletionStatusUseCaseImpl!

    override func setUp() {
        super.setUp()
        mockRepository = MockTaskRepository()
        updateTaskUseCase = UpdateTaskCompletionStatusUseCaseImpl(repository: mockRepository)
    }

    func testUpdateTasks() {
        // Arrange
        let task = TaskItem(id: UUID(), title: "Task to Delete", priority: "Low", dueDate: Date(), isCompleted: false)
        mockRepository.tasks = [task]

        // Act
        updateTaskUseCase.execute(task: task,isCompleted: true)

        // Assert
        XCTAssertTrue(mockRepository.taskUpdated, "updateTask should call the repository's updateTask method.")
    }
}
