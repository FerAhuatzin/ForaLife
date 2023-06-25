//
//  CoreDataManager.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 24/06/23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataBase") // Reemplaza "YourDataModel" con el nombre de tu archivo de modelo de datos
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Error al cargar la tienda persistente de Core Data: \(error)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Error al guardar el contexto de Core Data: \(nsError)")
            }
        }
    }
    
    // Otros métodos y funcionalidades de Core Data pueden ser implementados aquí
}
