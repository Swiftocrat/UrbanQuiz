//
//  ContentView.swift
//  UrbanQuiz
//
//  Created by Yaroslav Vyshniak on 18.05.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @FetchRequest(
     entity: Question.entity(),
     sortDescriptors: []
   ) var questions: FetchedResults<Question>
  @Environment(\.managedObjectContext) var mock
  
    var body: some View {
      VStack(alignment: .center) {
        
        Spacer()
        Image("tram")
          .resizable()
          .frame(width: 300, height: 170, alignment: .top)
          .padding(.top, -10)
          .scaledToFill()
        Spacer()
        Text(questions[0].body!)
          .bold()
        Spacer()
        ForEach(0...3, id: \.self) { answer in
          QuizButtonView(title: questions[0].answers![answer], position: answer) {
            if answer == questions[0].correct {
              let _ = print("correct")
            } else {
              let _ = print("error")
            }
          }
        }
        Spacer()
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
// let ss = Question(context: self.moc)
// ss.body = "Чи трамвай може бути альтернативою метро?"
// ss.id = questions[0].id
// ss.answers = ["Ні, не може бути","У випадку, коли метро задороге", "У випадку, коли грунт поганий","Так, може бути завжди"]
// ss.correct = 0
// try? self.mock.save()
