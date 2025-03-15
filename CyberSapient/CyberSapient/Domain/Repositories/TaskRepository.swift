//
//  TaskRepository.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//

protocol TaskRepository {
    func fetchTasks(filter: TaskFilter) -> [TaskItem]
    func addTask(task: TaskItem)
    func deleteTask(task: TaskItem)
    func updateTaskCompletionStatus(task: TaskItem, isCompleted: Bool)
}
