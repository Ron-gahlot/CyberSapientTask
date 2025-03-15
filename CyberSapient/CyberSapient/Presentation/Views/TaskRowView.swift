//
//  TaskRowView.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//



import SwiftUI
struct TaskRowView: View {
    let task: TaskItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Circle()
                .fill(priorityColor(for: task.priority))
                .frame(width: 12, height: 12)
                .padding(.top, 4)

            VStack(alignment: .leading, spacing: 8) {
                Text(task.title)
                    .font(.headline)
                HStack {
                    Text("Due on: \(task.dueDate.formatted(date: .abbreviated, time: .omitted))")
                        .font(.caption)
                    Spacer()
                    if task.isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
                if let description = task.taskDesc, !description.isEmpty {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
            }
        }
        .padding(.vertical, 8)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: task)
    }

    private func priorityColor(for priority: String) -> Color {
        switch priority {
        case "High":
            return .red
        case "Medium":
            return .orange
        case "Low":
            return .green
        default:
            return .gray
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(task: TaskItem(
            id: UUID(),
            title: "Buy groceries",
            taskDescription: "Milk, eggs, bread",
            priority: "High",
            dueDate: Date(),
            isCompleted: false
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
