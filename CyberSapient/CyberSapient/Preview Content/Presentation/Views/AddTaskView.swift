//
//  AddTaskView.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//
import SwiftUI
import CoreData
struct AddTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: AddTaskViewModel

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $viewModel.title)
                    TextField("Description", text: $viewModel.taskDescription)
                    Picker("Priority", selection: $viewModel.priority) {
                        Text("Low").tag("Low")
                        Text("Medium").tag("Medium")
                        Text("High").tag("High")
                    }
                    DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: .date)
                }
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.addTask()
                        dismiss()
                    }
                    .disabled(viewModel.title.isEmpty)
                }
            }
        }
    }
}

