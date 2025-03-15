//
//  AddTaskUseCaseTests.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 12/03/25.
//

@testable import CyberSapient
import XCTest

class AddTaskUseCaseTests: XCTestCase {
    var mockRepository: MockTaskRepository!
    var addTaskUseCase: AddTaskUseCaseImpl!

    override func setUp() {
        super.setUp()
        mockRepository = MockTaskRepository()
        addTaskUseCase = AddTaskUseCaseImpl(repository: mockRepository)
    }

    func testAddTask() {
        // Arrange
        let task = TaskItem(id: UUID(), title: "New Task", priority: "Medium", dueDate: Date(), isCompleted: false)

        // Act
        addTaskUseCase.execute(task: task)

        // Assert
        XCTAssertTrue(mockRepository.addTaskCalled, "AddTask should call the repository's addTask method.")
        XCTAssertEqual(mockRepository.tasks.count, 1, "Tasks count should be 1 after adding a task.")
        XCTAssertEqual(mockRepository.tasks[0].title, "New Task", "Added task title should be 'New Task'.")
    }
}
