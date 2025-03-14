//
//  TaskRepositoryImpl.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//

class TaskRepositoryImpl: TaskRepository {
    private let coreDataSource: CoreDataSource

    init(coreDataSource: CoreDataSource) {
        self.coreDataSource = coreDataSource
    }

    func fetchTasks(filter: TaskFilter) -> [TaskItem] {
        return coreDataSource.fetchTasks(filter: filter)
    }

    func addTask(task: TaskItem) {
        coreDataSource.addTask(task: task)
    }

    func deleteTask(task: TaskItem) {
        coreDataSource.deleteTask(task: task)
    }
    
    func updateTaskCompletionStatus(task: TaskItem, isCompleted: Bool) {
            coreDataSource.updateTaskCompletionStatus(task: task, isCompleted: isCompleted)
        }
}
