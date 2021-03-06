//
//  ContentView.swift
//  UrbanQuiz
//
//  Created by Yaroslav Vyshniak on 18.05.2021.
//

import SwiftUI

struct ContentView: View {
  
  var answers = ["Ні, не може бути","У випадку, коли метро задороге", "У випадку, коли грунт поганий","Так, може бути завжди"]
  
    var body: some View {

      VStack(alignment: .center) {
        Image("tram")
          .resizable()
          .frame(width: 300, height: 170, alignment: .top)
          .padding(.top, -10)
          .scaledToFill()
        Text("Чи трамвай може бути альтернативою метро?")
          .bold()
        //Spacer(minLength: 5)
        ForEach(answers, id: \.self) { answer in
          Button(answer) {
            print("some shit")
          }
          .padding()
          .background(Color.orange)
          .foregroundColor(.black)
          .cornerRadius(15)

        }
      }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
