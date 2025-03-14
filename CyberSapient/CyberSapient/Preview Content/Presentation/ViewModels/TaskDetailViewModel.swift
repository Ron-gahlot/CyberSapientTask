//
//  TaskDetailViewModel.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 13/03/25.
//

import CoreData

class TaskDetailViewModel: ObservableObject {
    @Published var task: TaskItem

    private let taskRepository: TaskRepository
    private let deleteTaskUseCase: DeleteTaskUseCaseImpl
    private let updateTaskCompletionStatusUseCase: UpdateTaskCompletionStatusUseCaseImpl
    init(task: TaskItem, taskRepository: TaskRepository) {
        self.task = task
        self.taskRepository = taskRepository
        self.deleteTaskUseCase = DeleteTaskUseCaseImpl(repository: self.taskRepository)
        self.updateTaskCompletionStatusUseCase = UpdateTaskCompletionStatusUseCaseImpl(repository: self.taskRepository)
    }

    func toggleCompletionStatus() {
        let isCompleted = !task.isCompleted
        updateTaskCompletionStatusUseCase
            .execute(task: task, isCompleted: isCompleted)
        task.isCompleted = isCompleted
    }

    func deleteTask() {
        deleteTaskUseCase
            .execute(task: task)
    }
}
