//
//  TaskListViewModel.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//

import Foundation
import SwiftUI

class TaskListViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []
    @Published var filter: TaskFilter = .all
    @Published var sortOption: TaskSortOption = .dueDate
    @State var isAddTaskOpen: Bool = false
    let taskRepository: TaskRepository
    private let deleteTaskUseCase: DeleteTaskUseCaseImpl
    private let fetchTasksUseCase: FetchTasksUseCaseImpl
    init(taskRepository: TaskRepository) {
        self.taskRepository = taskRepository
        self.deleteTaskUseCase = DeleteTaskUseCaseImpl(repository: taskRepository)
        self.fetchTasksUseCase = FetchTasksUseCaseImpl(repository: taskRepository)
        fetchTasks()
    }

    func fetchTasks() {
        tasks = fetchTasksUseCase.execute(filter: filter)
        sortTasks()
    }

    func deleteTask(task: TaskItem) {
        deleteTaskUseCase.execute(task: task)
        fetchTasks()
    }
    
    private func sortTasks() {
           switch sortOption {
           case .priority:
               tasks.sort { $0.priority > $1.priority } // Sort by priority (High > Medium > Low)
           case .dueDate:
               tasks.sort { $0.dueDate < $1.dueDate } // Sort by due date (earliest first)
           case .title:
               tasks.sort { $0.title < $1.title } // Sort alphabetically by title
           }
       }
}
