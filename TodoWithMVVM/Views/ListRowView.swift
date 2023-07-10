//
//  ListRowView.swift
//  TodoWithMVVM
//
//  Created by 황지우2 on 2023/07/10.
//

import SwiftUI

struct ListRowView: View {
    let title: String
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "묘묭")
    }
}
