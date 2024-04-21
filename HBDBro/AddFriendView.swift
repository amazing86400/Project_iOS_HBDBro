//
//  AddFriendView.swift
//  HBDBro
//
//  Created by KIBEOM SHIN on 4/20/24.
//

import SwiftUI

struct AddFriendView: View {
    // 사람 추가 사용 변수
    @State private var newName = ""
    @State private var newbirthday = Date.now
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("생일자 추가")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 70)
                
                VStack(alignment: .leading) {
                    Text("이름 입력")
                        .font(.headline)
                    TextField("이름을 입력하세요", text: $newName)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.all, 10)
                
                VStack(alignment: .leading) {
                    Text("생일 입력")
                        .font(.headline)
                    DatePicker("생일 입력", selection: $newbirthday, in: Date.distantPast...Date.now, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                }
                .padding(.all, 10)
            }
            .padding()
            .toolbar {
                Button {
                    context.insert(Friends(name: newName, birthday: newbirthday))
                    newName = ""
                    newbirthday = .now
                    dismiss()
                } label: {
                    Text("저장")
                }
                .padding()
            }
        }
    }
}

#Preview {
    AddFriendView()
}
