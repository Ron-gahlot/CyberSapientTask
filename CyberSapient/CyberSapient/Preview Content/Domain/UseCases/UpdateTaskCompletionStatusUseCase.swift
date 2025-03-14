//
//  UpdateTaskCompletionStatusUseCase.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 14/03/25.
//

protocol UpdateTaskCompletionStatusUseCase {
    func execute(task: TaskItem, isCompleted: Bool)
}
