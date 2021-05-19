//
//  QuizButtonView.swift
//  UrbanQuiz
//
//  Created by Yaroslav Vyshniak on 18.05.2021.
//

import Foundation
import SwiftUI


struct OrangeButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .background(Color.orange)
      .foregroundColor(.black)
      //      .cornerRadius(15)
      .clipShape(Capsule())
      .scaleEffect(configuration.isPressed ? 1.2 : 1)
      .animation(.easeOut(duration: 0.2))
  }
}

struct QuizButtonView: View {
  var title: String
  var position: Int
  var action: () -> Void
  
  var body: some View {
    Button(title,action: action).buttonStyle(OrangeButton())
  }
}
