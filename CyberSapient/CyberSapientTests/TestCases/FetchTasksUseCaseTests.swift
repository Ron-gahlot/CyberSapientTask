//
//  FetchTasksUseCaseTests.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 12/03/25.
//

@testable import CyberSapient
import XCTest

class FetchTasksUseCaseTests: XCTestCase {
    var mockRepository: MockTaskRepository!
    var fetchTasksUseCase: FetchTasksUseCaseImpl!

    override func setUp() {
        super.setUp()
        mockRepository = MockTaskRepository()
        fetchTasksUseCase = FetchTasksUseCaseImpl(repository: mockRepository)
    }

    func testFetchTasks() {
        // Arrange
        let task1 = TaskItem(id: UUID(), title: "Task 1", priority: "High", dueDate: Date(), isCompleted: false)
        let task2 = TaskItem(id: UUID(), title: "Task 2", priority: "Low", dueDate: Date(), isCompleted: true)
        mockRepository.tasks = [task1, task2]

        // Act
        let fetchedTasks = fetchTasksUseCase.execute(filter: .all)

        // Assert
        XCTAssertTrue(mockRepository.fetchTasksCalled, "FetchTasks should call the repository's fetchTasks method.")
        XCTAssertEqual(fetchedTasks.count, 2, "Fetched tasks count should be 2.")
        XCTAssertEqual(fetchedTasks[0].title, "Task 1", "First task title should be 'Task 1'.")
        XCTAssertEqual(fetchedTasks[1].title, "Task 2", "Second task title should be 'Task 2'.")
    }
}
