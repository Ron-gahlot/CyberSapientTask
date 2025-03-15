// Presentation/Views/TaskListView.swift
import SwiftUI
import CoreData

struct TaskListView: View {
    @StateObject private var viewModel: TaskListViewModel
    @State private var showAddTaskView = false
    @State private var isAddButtonPulsing = false

    init(viewModel: TaskListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Group {
                    if viewModel.tasks.isEmpty {
                        EmptyStateView ()
                    } else {
                        List {
                            ForEach(viewModel.tasks) { task in
                                NavigationLink(destination: TaskDetailView(
                                    task: task,
                                    taskRepository: viewModel.taskRepository
                                )) {
                                    TaskRowView(task: task)
                                }
                                .transition(.opacity.combined(with: .scale)) // Fade and scale animation
                            }
                            .onDelete { offsets in
                                withAnimation {
                                    offsets.forEach { index in
                                        viewModel.deleteTask(task: viewModel.tasks[index])
                                    }
                                }
                            }
                            .onMove { (source, destination) in
                                viewModel.tasks.move(fromOffsets: source, toOffset: destination)
                            }
                        }
                        .animation(.default, value: viewModel.tasks) // Animate list changes
                    }
                }

                // Floating "Add" Button
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2).repeatCount(1, autoreverses: true)) {
                        isAddButtonPulsing.toggle()
                    }
                    showAddTaskView = true
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .scaleEffect(isAddButtonPulsing ? 1.2 : 1) // Pulse effect
                }
                .padding()
            }
            .navigationTitle("Tasks (\(viewModel.filter.rawValue))")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu("Filter") {
                        Picker("Filter", selection: $viewModel.filter) {
                            ForEach(TaskFilter.allCases, id: \.self) { filter in
                                Text(filter.rawValue).tag(filter)
                            }
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu("Sort") {
                        Picker("Sort By", selection: $viewModel.sortOption) {
                            ForEach(TaskSortOption.allCases, id: \.self) { option in
                                Text(option.rawValue).tag(option)
                            }
                        }
                    }
                }
            }
            .onChange(of: viewModel.filter) {
                viewModel.fetchTasks()
            }
            .onChange(of: viewModel.sortOption) { 
                viewModel.fetchTasks()
            }
            .onAppear {
                viewModel.fetchTasks()
            }
            
            .navigationDestination(isPresented: $showAddTaskView) {
                AddTaskView(viewModel: AddTaskViewModel(taskRepository: viewModel.taskRepository))
            }
        }
    }

    private func onSheetDismissed() {
        viewModel.fetchTasks()
        print("Add Task sheet dismissed")
    }
}
