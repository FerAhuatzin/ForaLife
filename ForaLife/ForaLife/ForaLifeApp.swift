//
//  ForaLifeApp.swift
//  ForaLife
//
//  Created by Fernando Ahuatzin Gallardo on 15/06/23.
//

import SwiftUI

@main
struct ForaLifeApp: App {
    @StateObject private var coreDataManager = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            InitialView()
                .environment(\.managedObjectContext, coreDataManager.container.viewContext)
        }
    }
}
