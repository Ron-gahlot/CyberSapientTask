//
//  ContentView.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 14/03/25.
//

import SwiftUI
struct ContentView: View {
    let coreDataSource = CoreDataSource(context: PersistenceController.shared.container.viewContext)
    var taskRepository: TaskRepository {
        TaskRepositoryImpl(coreDataSource: coreDataSource)
    }
    var body: some View {
        NavigationStack {
            TaskListView(viewModel: TaskListViewModel(taskRepository: taskRepository))
        }
    }
}
