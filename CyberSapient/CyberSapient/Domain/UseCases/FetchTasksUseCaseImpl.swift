//
//  FetchTasksUseCaseImpl.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//


class FetchTasksUseCaseImpl: FetchTasksUseCase {
    private let repository: TaskRepository

    init(repository: TaskRepository) {
        self.repository = repository
    }

    func execute(filter: TaskFilter) -> [TaskItem] {
        return repository.fetchTasks(filter: filter)
    }
}