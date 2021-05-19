//
//  QuestionsStorage.swift
//  UrbanQuiz
//
//  Created by Yaroslav Vyshniak on 19.05.2021.
//

import Foundation

//extension Question {
//  static var customFetchRequest: NSFetchRequest<Question> {
//    let request:NSFetchRequest<Question> = Question.fetchRequest()
//    return request
//  }
//}
//
//
//class QuestionsStorage: NSObject, ObservableObject {
//  @Published var questions: [Question] = []
//  private let questionsController: NSFetchedResultsController<Question>
//
//  init(managedObjectContext: NSManagedObjectContext) {
//    questionsController = NSFetchedResultsController(fetchRequest: Question.customFetchRequest,
//    managedObjectContext: managedObjectContext,
//    sectionNameKeyPath: nil, cacheName: nil)
//
//    super.init()
//
//    questionsController.delegate = self
//
//    do {
//      try questionsController.performFetch()
//      questions = questionsController.fetchedObjects ?? []
//    } catch {
//      print("failed to fetch items!")
//    }
//  }
//}
//
//extension QuestionsStorage: NSFetchedResultsControllerDelegate {
//  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//    guard let items = controller.fetchedObjects as? [Question]
//      else { return }
//
//    questions = items
//  }
//}
