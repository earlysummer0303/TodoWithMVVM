//
//  AddView.swift
//  TodoWithMVVM
//
//  Created by 황지우2 on 2023/07/10.
//

import SwiftUI

struct AddView: View {
    // presentationMode - 뷰 계층 구조에서 우리가 어디에 있는지 모니터링.
    @Environment(\.presentationMode) var presentationMode
    // ListViewModel에 있는 데이터의 List를 update 해야 하므로, ListViewModel 참조 필요
    @EnvironmentObject var listViewModel: ListViewModel
    @State var inputData: String = ""
    
    // 알럿(일정 수 이상의 단어를 적지 않았을 경우 경고) 관련 변수
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something Here", text: $inputData)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.cyan)
                        .cornerRadius(10)
                })
            }
            .padding()
        }
        .navigationTitle("Add an Item🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
        // 🤔 OK버튼을 누르면 isPresented의 아규먼트가 자동으로 toggle() 되는걸까?
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(newItem: inputData)
            //입력후 자동으로 ListView로 돌아가게
            presentationMode.wrappedValue.dismiss() // 뷰 하이어라키 상 상위로 돌아가게 하기.
        }
    }
    
    // 입력된 텍스트의 수가 기본갑 이상인지 체크하는 함수.
    func textIsAppropriate() -> Bool {
        guard inputData.count >= 3 else {
            alertTitle = "3글자 이상의 투두를 장성해주세요!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    // 알럿을 get하는 함수.
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
