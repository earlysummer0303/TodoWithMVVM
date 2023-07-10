//
//  AddView.swift
//  TodoWithMVVM
//
//  Created by 황지우2 on 2023/07/10.
//

import SwiftUI

struct AddView: View {
    @State var inputData: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something Here", text: $inputData)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
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
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
