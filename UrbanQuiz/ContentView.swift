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
  
  var body: some View {
    VStack(alignment: .center) {
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
        }
        .disabled(buttonsDisabled)
      }
      Spacer()
      Button(action: {}) {
        HStack {
          Text("Наступне питання")
            .foregroundColor(Color.black)
          Image(systemName:"arrowshape.zigzag.right.fill")
            .foregroundColor(Color.orange)
        }
        .padding()
        .overlay(
          RoundedRectangle(cornerRadius: 25)
            .stroke(Color.orange, lineWidth: 3)
        )
        .isHidden(!buttonsDisabled)
        .onTapGesture {
          print("Next question")
          
          
          self.buttonsDisabled = false
          self.currentPosition = 5
          if currentQuestion < questions.count - 1 {
            // self.currentQuestion += self.currentQuestion == 0 ? 2 : 1
            self.currentQuestion += 1
          }
        }
      }
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
