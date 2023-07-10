
import Foundation

//ForEach문의 사용을 위해, 모델을 Identifiable에 conform 하도록 만들어 주면 좋다.
struct ItemModel : Identifiable {
    var id: String = UUID().uuidString //랜덤한 id값을 반환하는 함수.
    // third party 데이터베이스 등에 입력하기 용이한 형식을 위해 .uuidString을 활용해 String type으로 변환.
    var isCompleted: Bool = false
    var title: String
}
