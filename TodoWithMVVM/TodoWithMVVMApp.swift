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
 ViewModel - manages Models for View
 
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
