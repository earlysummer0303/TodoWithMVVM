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
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            // 이 네비게이션 뷰가 EnvironmentObject로 listViewModel을 참조할 수 있도록 만들어주기.
            .environmentObject(listViewModel)
        }
    }
}
