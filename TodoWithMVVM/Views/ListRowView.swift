//
//  ListRowView.swift
//  TodoWithMVVM
//
//  Created by 황지우2 on 2023/07/10.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical)
    }
}

struct ListRowView_Previews: PreviewProvider {
    // 여러개의 프리뷰 만드는 법
    static var item1 = ItemModel(title: "첫번째꺼")
    static var item2 = ItemModel(isCompleted: true, title: "두번째꺼")
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        //해당 뷰의 레이아웃을 뷰의 사이즈에 딱 맞추기
    }
}
