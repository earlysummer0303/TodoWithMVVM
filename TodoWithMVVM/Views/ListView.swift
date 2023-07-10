//
//  ListView.swift
//  TodoWithMVVM
//
//  Created by 황지우2 on 2023/07/10.
//

import SwiftUI

// Referencing View Model in View

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List{
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        // 각 셀들이 Tap 되었을때의 인터랙션을 기준으로 판별.
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            // list의 onDelete와 onMove 공부할것.
            .onDelete(perform: listViewModel.deleteItem)
            // onMove에서 ~ indice: from, offset: to
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


