//
//  TaskDetailView.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//

import SwiftUI
import CoreData

struct TaskDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: TaskDetailViewModel
    @State private var showDeleteConfirmation = false

    init(task: TaskItem, taskRepository: TaskRepository) {
        _viewModel = StateObject(wrappedValue: TaskDetailViewModel(
            task: task,
            taskRepository: taskRepository
        ))
    }

    var body: some View {
        Form {
            Section(header: Text("Task Details")) {
                Text(viewModel.task.title)
                if let description = viewModel.task.taskDesc, !description.isEmpty {
                    Text(description)
                        .foregroundColor(.gray)
                }
                Text("Priority: \(viewModel.task.priority)")
                Text("Due Date: \(viewModel.task.dueDate.formatted(date: .abbreviated, time: .omitted))")
            }

            Section {
                Button(action: {
                    viewModel.toggleCompletionStatus()
                }) {
                    Text(viewModel.task.isCompleted ? "Mark as Pending" : "Mark as Completed")
                        .foregroundColor(viewModel.task.isCompleted ? .orange : .green)
                }

                Button(role: .destructive, action: {
                    showDeleteConfirmation = true
                }) {
                    Text("Delete Task")
                }
            }
        }
        .navigationTitle("Task Details")
        .confirmationDialog("Delete Task", isPresented: $showDeleteConfirmation) {
            Button("Delete", role: .destructive) {
                viewModel.deleteTask()
                dismiss()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure you want to delete this task?")
        }
    }
}
