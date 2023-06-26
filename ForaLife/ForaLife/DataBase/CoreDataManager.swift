//
//  CoreDataManager.swift
//  ForaLife
//
//  Created by Ricardo Ladislao Martinez Cabrera on 24/06/23.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager: ObservableObject {
    
    let container = NSPersistentContainer(name: "DataBase")
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }

    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Saved")
        } catch {
            print("not saved")
        }
    }
    
    func addUser (username: String, universityName: String, password: String, longitude: Double, latitude: Double, address: String, name: String, lastname: String, context: NSManagedObjectContext) {
        let user = User(context: context)
        user.userName = username
        user.universityName = universityName
        user.password = password
        user.longitude = longitude
        user.latitude = latitude
        user.address = address
        user.name = name
        user.lastname = lastname
        save(context: context)
    }
    func editUser(user: User, username: String, universityName: String, password: String, longitude: Double, latitude: Double, address: String, name: String, lastname: String, context: NSManagedObjectContext) {
        user.userName = username
        user.universityName = universityName
        user.password = password
        user.longitude = longitude
        user.latitude = latitude
        user.address = address
        user.name = name
        user.lastname = lastname
        save(context: context)
    }
    
    func fetchUser(username: String, password: String, context: NSManagedObjectContext, completion: @escaping (Bool, User?) -> Void) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userName == %@ AND password == %@", username, password)
        
        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                completion(true, user)
            } else {
                completion(false, nil)
            }
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
            completion(false, nil)
        }
    }
    
    func deleteUsers(context: NSManagedObjectContext) {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            
            do {
                try context.execute(deleteRequest)
                try context.save()
                print("All users deleted successfully.")
            } catch {
                print("Error deleting users: \(error.localizedDescription)")
            }
        }
    
    func showUser(context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let users = try context.fetch(fetchRequest)
            for user in users {
                print("User ID: \(user.objectID)")
                print("UserName: \(user.userName ?? "")")
                print("UniversityName: \(user.universityName ?? "")")
                print("Password: \(user.password ?? "")")
                print("Longitude: \(user.longitude)")
                print("Latitude: \(user.latitude)")
                print("Address: \(user.address ?? "")")
                print("Name: \(user.name ?? "")")
                print("Lastname: \(user.lastname ?? "")")
                print("---------------------")
            }
        } catch {
            print("Failed to fetch users: \(error.localizedDescription)")
        }
    }
        
    func addUniversity (universityName: String, context: NSManagedObjectContext) {
        let university = University(context: context)
        university.universityName = universityName
        save(context: context)
    }
    func editUniversity(university: University, universityName: String, context: NSManagedObjectContext) {
        university.universityName = universityName
        save(context: context)
    }
    
    func adForeignPlaces (placeDescription: String ,universityName: String, context: NSManagedObjectContext) {
        let foreignPlace = ForeignPlaces(context: context)
        foreignPlace.placeDescription = placeDescription
        foreignPlace.universityName = universityName
        foreignPlace.verified = false
        save(context: context)
    }
    func editForeignPlaces (university: University, universityName: String, context: NSManagedObjectContext) {
        university.universityName = universityName
        save(context: context)
    }
    
}
