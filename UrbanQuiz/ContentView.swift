//
//  ContentView.swift
//  UrbanQuiz
//
//  Created by Yaroslav Vyshniak on 18.05.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @FetchRequest(entity: Question.entity(), sortDescriptors: [])
  var questions: FetchedResults<Question>
  @Environment(\.managedObjectContext) var mock
  @State private var buttonsDisabled = false
  @State private var currentPosition = 5
  @State private var currentQuestion = 0
  @State private var correctCounter = 0
  @State private var isQuizEnded = false
  
  var body: some View {
    ZStack(alignment: .center) {
      VStack(alignment: .center) {
        Spacer()
        Text("\(correctCounter)/\(questions.count)")
          .font(Font.system(.title3))
          .padding()
          .background(Color.orange)
          .clipShape(Circle())
        Spacer()
        Image(uiImage: UIImage(data: questions[currentQuestion].image!)!)
          .resizable()
          .frame(width: 300, height: 170, alignment: .top)
          .padding(.top, -10)
          .scaledToFill()
        Spacer()
        Text(questions[currentQuestion].body!)
          .bold()
        Spacer()
        ForEach(0...3, id: \.self) { answer in
          QuizButtonView(title: questions[currentQuestion].answers![answer], position: answer, correctIndex: Int(questions[currentQuestion].correct), didTap: self.buttonsDisabled, currentIndex: self.currentPosition) {
            buttonsDisabled = true
            currentPosition = answer
            if answer == Int(questions[currentQuestion].correct) {
              self.correctCounter += 1
            }
          }
          .disabled(buttonsDisabled)
        }
        Spacer()
        NextButtonView(buttonsDisabled: self.buttonsDisabled, isLastQuestion: self.currentQuestion == questions.count - 1) {
          self.buttonsDisabled = false
          self.currentPosition = 5
          if currentQuestion < questions.count - 1 {
            self.currentQuestion += 1
          } else {
            isQuizEnded = true
          }
        }
      }
      .isHidden(isQuizEnded)
      VStack(alignment: .center) {
        
        Text("\(correctCounter)/\(questions.count)")
          .font(Font.system(.title3))
          .padding()
          .background(Color.orange)
          .clipShape(Circle())
        
        Text(resultCalculations())
          .font(Font.system(.largeTitle))
      }.isHidden(!isQuizEnded)
    }
  }
  
  func resultCalculations() -> String {
    switch correctCounter {
      case let res where res == questions.count:
        return "Схоже ви справжній урбаніст"
      case let res where res > ((questions.count) / 2) && res < questions.count:
        return "Фанат блогів Варламова"
      case let res where res <= ((questions.count) / 2) && res > 0:
        return "Фейсбучний транспортний експерт"
      case let res where res == 0:
        return "Міцний господарник"
      default: return ""
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

// Question saving example
//
//
//        let data = UIImage(named: "genplan")!.jpegData(compressionQuality: 1.0)
//        let ss = Question(context: self.mock)
//        ss.body = "Хто має бути в пріоритеті містобудування?"
//        ss.id = UUID()
//        ss.answers = ["Приватні авто","Велосипедисти", "Пішоходи","Всі рівні"]
//        ss.correct = 2
//        ss.image = data
//     try? self.mock.save()

// Deleting data from DB
//for question in questions {
//  mock.delete(question)
//}
//
//do {
//  try mock.save()
//} catch {
//  // handle the Core Data error
//}





