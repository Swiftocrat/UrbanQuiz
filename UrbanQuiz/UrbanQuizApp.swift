//
//  UrbanQuizApp.swift
//  UrbanQuiz
//
//  Created by Yaroslav Vyshniak on 18.05.2021.
//

import SwiftUI
import CoreData

@main
struct UrbanQuizApp: App {
 let context = PersistentCloudKitContainer.persistentContainer.viewContext
  
    var body: some Scene {
        WindowGroup {
            ContentView()
              .environment(\.managedObjectContext, context)
        }
    }
}


        
