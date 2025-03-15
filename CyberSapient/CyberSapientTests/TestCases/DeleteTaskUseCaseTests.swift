//
//  DeleteTaskUseCaseTests.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 12/03/25.
//

@testable import CyberSapient
import XCTest

class DeleteTaskUseCaseTests: XCTestCase {
    var mockRepository: MockTaskRepository!
    var deleteTaskUseCase: DeleteTaskUseCase!

    override func setUp() {
        super.setUp()
        mockRepository = MockTaskRepository()
        deleteTaskUseCase = DeleteTaskUseCaseImpl(repository: mockRepository)
    }

    func testDeleteTask() {
        // Arrange
        let task = TaskItem(id: UUID(), title: "Task to Delete", priority: "Low", dueDate: Date(), isCompleted: false)
        mockRepository.tasks = [task]

        // Act
        deleteTaskUseCase.execute(task: task)

        // Assert
        XCTAssertTrue(mockRepository.deleteTaskCalled, "DeleteTask should call the repository's deleteTask method.")
        XCTAssertEqual(mockRepository.tasks.count, 0, "Tasks count should be 0 after deleting the task.")
    }
}
