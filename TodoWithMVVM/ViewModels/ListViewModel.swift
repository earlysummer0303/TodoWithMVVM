//
//  ListViewModel.swift
//  TodoWithMVVM
//
//  Created by 황지우2 on 2023/07/10.
//

import Foundation

// 뷰모델은 class로 구성한다.

// 뷰에서의 'Data Logic'을 구현하는 측면에서 다음 두가지 함수 필요.
/*
 - 리스트 item을 delete 하는 함수 => getItem
 - 리스트 item을 delete 하는 함수 => deleteItem
 - 리스트 item을 move 하는 함수 => moveItem
 */

// App.Swift 파일에 뷰 모델 인스턴스 선언.
class ListViewModel : ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItem = [
            // 모델 데이터 세팅
            ItemModel(isCompleted: false, title: "오늘 할 일 1"),
            ItemModel(isCompleted: false, title: "오늘 할 일 2"),
            ItemModel(isCompleted: false, title: "오늘 할 일 3")
        ]
        items.append(contentsOf: newItem)
    }
    func addItem(newItem: String){
        items.append(ItemModel(isCompleted: false, title: newItem))
    }
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(item: ItemModel) { // 해당 모델의 isCompleted 값을 변경.
        // item을 받아서, 이 아이템이 items에 있는지 확인
        // index = > Int?
        // ⭐️⭐️⭐️⭐️⭐️⭐️⭐️~ 잘 모르겠음 ~⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️
//        if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//        }{
//            // true일 경우 일어나는 일
//        }
        // if - let 바인딩을 활용해, item이 리스트에 있는 경우 브라켓 안의 코드 진행.
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            // 🤔왜 item[index].toggle()을 하지 않는거지? => Immutable Struct를 사용하려면 그렇게 해야.
            // Model의 프로퍼티 값을 바꾸는 것이 아니라, 새로운 인스턴스를 넣는것.
            items[index] = item.updateCompletion() // 리스트의 해당 index에 item.updateCompletion() 값을 넣는것.
        }
    }
}
