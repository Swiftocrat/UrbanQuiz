//
//  QuizButtonView.swift
//  UrbanQuiz
//
//  Created by Yaroslav Vyshniak on 18.05.2021.
//

import Foundation
import SwiftUI


struct QuizButtonStyle: ButtonStyle {
  var isCorrect:Bool
  var didTap:Bool
  var glow:Bool
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .background(didTap ? (isCorrect ? Color.green : Color.red) : Color.orange)
      .foregroundColor(.black)
      .clipShape(Capsule())
      .scaleEffect(configuration.isPressed ? 1.2 : 1)
      .animation(.easeOut(duration: 0.2))
      .shadow(color: (glow && didTap) ? .blue : .clear, radius: 8)
  }
}

struct QuizButtonView: View {
  var title: String
  var position: Int
  var correctIndex: Int
  var didTap:Bool
  var currentIndex:Int
  var action: () -> Void
 
  
  var body: some View {
    Button(title,action: action).buttonStyle(QuizButtonStyle(isCorrect: correctIndex == position, didTap: didTap, glow: currentIndex == position))
  }
}
