//
//  AddTaskUseCaseImpl.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//


class AddTaskUseCaseImpl: AddTaskUseCase {
    private let repository: TaskRepository
    
    init(repository: TaskRepository) {
        self.repository = repository
    }
    
    func execute(task: TaskItem) {
        repository.addTask(task: task)
        
    }
}
