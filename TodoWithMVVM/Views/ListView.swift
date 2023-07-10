//
//  ListView.swift
//  TodoWithMVVM
//
//  Created by 황지우2 on 2023/07/10.
//

import SwiftUI

// 뷰에서의 'Data Logic'을 구현하는 측면에서 다음 두가지 함수 필요.
/*
 - 리스트 item을 delete 하는 함수 => deleteItem
 - 리스트 item을 move 하는 함수 => moveItem
 */

struct ListView: View {
    
    @State var items: [ItemModel] = [
        // 모델 데이터 세팅
        ItemModel(title: "오늘 할 일 1"),
        ItemModel(title: "오늘 할 일 2"),
        ItemModel(title: "오늘 할 일 3")
    ]
    
    var body: some View {
        List{
            ForEach(items) { item in
                ListRowView(item: item)
            }
            // list의 onDelete와 onMove 공부할것.
            .onDelete(perform: deleteItem)
            // onMove에서 ~ indice: from, offset: to
            .onMove(perform: moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
    }
}


