//
//  NextButtonView.swift
//  UrbanQuiz
//
//  Created by Yaroslav Vyshniak on 25.05.2021.
//

import Foundation
import SwiftUI

struct NextButtonView: View {
  var buttonsDisabled: Bool
  var isLastQuestion: Bool
  var action: () -> Void
 
  
  var body: some View {
    Button(action: {}) {
      HStack {
        Text(isLastQuestion ? "Результати" : "Наступне питання")
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
        action()
      }
    }
  }
}
