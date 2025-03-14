//
//  CoreDataSource.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//
import CoreData

class CoreDataSource {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func fetchTasks(filter: TaskFilter) -> [TaskItem] {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        switch filter {
        case .all:
            break
        case .completed:
            request.predicate = NSPredicate(format: "isCompleted == true")
        case .pending:
            request.predicate = NSPredicate(format: "isCompleted == false")
        }
        let taskEntities = try? context.fetch(request)
        return taskEntities?.map { $0.toDomain() } ?? []
    }

    func addTask(task: TaskItem) {
        let taskEntity = TaskEntity(context: context)
        taskEntity.id = task.id
        taskEntity.title = task.title
        taskEntity.taskDesc = task.taskDesc
        taskEntity.priority = task.priority
        taskEntity.dueDate = task.dueDate
        taskEntity.isCompleted = task.isCompleted
        try? context.save()
    }

    func deleteTask(task: TaskItem) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", task.id as any CVarArg as CVarArg)
        if let taskEntity = try? context.fetch(request).first {
            context.delete(taskEntity)
            try? context.save()
        }
    }
    
    func updateTaskCompletionStatus(task: TaskItem, isCompleted: Bool) {
           let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
           request.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)
           if let taskEntity = try? context.fetch(request).first {
               taskEntity.isCompleted = isCompleted
               try? context.save()
           }
       }
}

import CoreData

extension TaskEntity {
    func toDomain() -> TaskItem {
        return TaskItem(
            id: id ?? UUID(),
            title: title ?? "",
            taskDescription: taskDesc,
            priority: priority ?? "Low",
            dueDate: dueDate ?? Date(),
            isCompleted: isCompleted
        )
    }
}
