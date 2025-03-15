//
//  AddTaskViewModel.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//

import Foundation
import SwiftUI

class AddTaskViewModel: ObservableObject {
    @Published var title = ""
    @Published var taskDescription = ""
    @Published var priority = "Low"
    @Published var dueDate = Date()

    private let taskRepository: TaskRepository
    private let addTaskUseCase: AddTaskUseCaseImpl
    init(taskRepository: TaskRepository) {
        self.taskRepository = taskRepository
        self.addTaskUseCase = AddTaskUseCaseImpl(repository: self.taskRepository)
    }

    func addTask() {
        let task = TaskItem(
            title: title,
            taskDescription: taskDescription,
            priority: priority,
            dueDate: dueDate,
            isCompleted: false
        )
        addTaskUseCase
            .execute(task: task)
    }
}
