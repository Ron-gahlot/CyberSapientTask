//
//  MockTaskRepository.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 12/03/25.
//

@testable import CyberSapient
import XCTest

class MockTaskRepository: TaskRepository {
   
    var tasks: [TaskItem] = []
    var fetchTasksCalled = false
    var addTaskCalled = false
    var deleteTaskCalled = false

    func fetchTasks(filter: CyberSapient.TaskFilter) -> [TaskItem] {
        fetchTasksCalled = true
        return tasks
    }

    func addTask(task: CyberSapient.TaskItem) {
        addTaskCalled = true
        tasks.append(task)
    }

    func deleteTask(task: CyberSapient.TaskItem) {
        deleteTaskCalled = true
        tasks.removeAll { $0.id == task.id }
    }
    func updateTaskCompletionStatus(task: CyberSapient.TaskItem, isCompleted: Bool) {
        
    }
    
}
