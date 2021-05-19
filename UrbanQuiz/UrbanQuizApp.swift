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
  
//  let persistenceManager: PersistenceManager
//    @StateObject var todoItemStorage: QuestionsStorage
//
//    init() {
//      let manager = PersistenceManager()
//      self.persistenceManager = manager
//
//      let managedObjectContext = manager.persistentContainer.viewContext
//      let storage = QuestionsStorage(managedObjectContext: managedObjectContext)
//      self._questionsStorage = StateObject(wrappedValue: storage)
//    }

  
    var body: some Scene {
        WindowGroup {
            ContentView()
              .environment(\.managedObjectContext, context)
        }
    }
}


        
