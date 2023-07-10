//
//  TodoWithMVVMApp.swift
//  TodoWithMVVM
//
//  Created by 황지우2 on 2023/07/10.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - Data Point
 View - UI
 ⭐️ViewModel - manages Models for View
 ==> ViewModel이 MVVM 패턴에서의 가장 중추적인 파트.
 
 */

@main
struct TodoWithMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
        }
    }
}
