
import Foundation

//ForEach문의 사용을 위해, 모델을 Identifiable에 conform 하도록 만들어 주면 좋다.

// Imutable Struct : 모든 프로퍼티 값이 let인 Struct

struct ItemModel : Identifiable {
    let id: String
    // third party 데이터베이스 등에 입력하기 용이한 형식을 위해 .uuidString을 활용해 String type으로 변환.
    let isCompleted: Bool
    let title: String

    init(id: String = UUID().uuidString, isCompleted: Bool, title: String ){
        self.id = id  //랜덤한 id값을 반환하는 함수.
        self.isCompleted = isCompleted
        self.title = title
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, isCompleted: !isCompleted, title: title)
    }
}
