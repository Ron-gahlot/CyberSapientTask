//
//  UpdateTaskCompletionStatusUseCaseImpl.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 14/03/25.
//

class UpdateTaskCompletionStatusUseCaseImpl: UpdateTaskCompletionStatusUseCase {
    private let taskRepository: TaskRepository

    init(repository: TaskRepository) {
        self.taskRepository = repository
    }

    func execute(task: TaskItem, isCompleted: Bool) {
        taskRepository.updateTaskCompletionStatus(task: task, isCompleted: isCompleted)
    }
}
