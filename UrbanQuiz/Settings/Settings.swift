//
//  Settings.swift
//  UrbanQuiz
//
//  Created by Herr Truthahn on 18.05.2021.
//

import SwiftUI

let settingsItems: [SettingsItem] = [SettingsItem(title: "Username", value: "Tarrant"), SettingsItem(title: "Email", value: "Email"), SettingsItem(title: "Font", value: "Helvetica")]
let darkModeEntity =  SettingsItem(title: "Turn on dark mode", value: "No")

struct Settings: View {
    @State private var darkMode = false
    
    var body: some View {
        List {
            ForEach(settingsItems) { entity in
                HStack {
                    Text(entity.title).bold()
                    Divider()
                    Spacer()
                    Text(entity.value)
                }
            }
            HStack {
                Text(darkModeEntity.title).bold()
                Divider()
                Spacer()
                Toggle(isOn: $darkMode) {
                    Text("")
                }
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
