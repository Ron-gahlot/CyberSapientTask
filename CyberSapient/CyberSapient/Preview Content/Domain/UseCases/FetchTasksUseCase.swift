
//
//  FetchTasksUseCase.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//

protocol FetchTasksUseCase {
    func execute(filter: TaskFilter) -> [TaskItem]
}
