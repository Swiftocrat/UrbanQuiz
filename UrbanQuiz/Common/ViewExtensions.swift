//
//  ViewExtensions.swift
//  UrbanQuiz
//
//  Created by Yaroslav Vyshniak on 24.05.2021.
//

import Foundation
import SwiftUI

extension View {
  @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
    if hidden {
      if !remove {
        self.hidden()
      }
    } else {
      self
    }
  }
}
