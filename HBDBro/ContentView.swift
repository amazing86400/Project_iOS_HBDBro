//
//  ContentView.swift
//  HBDBro
//
//  Created by KIBEOM SHIN on 4/20/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // 데이터 모델
    @Query(sort: \Friends.birthday) private var friends: [Friends]
    @Environment(\.modelContext) private var context
    
    @State private var isAddFriendView = false
    
    var body: some View {
        NavigationStack {
            List {
                // 오늘 생일자 목록
                if friends.contains(where: {$0.isBirthday}) {
                    Section("생일인 친구") {
                        ForEach(friends.filter{ $0.isBirthday }) { friend in
                            NavigationLinkView(friend: friend, isBirthday: friend.isBirthday)
                        }
                        .onDelete(perform: { indexSet in
                            removeName(at: indexSet)
                        })
                    }
                    .bold()
                }
                // 전체 목록
                Section("친구") {
                    ForEach(friends) { friend in
                        NavigationLinkView(friend: friend, isBirthday: friend.isBirthday)
                    }
                    .onDelete(perform: { indexSet in
                        removeName(at: indexSet)
                    })
                }
            }
            //            .task {
            //                context.insert(Friends(name: "신기범", birthday: .now))
            //                context.insert(Friends(name: "김수현", birthday: .distantPast))
            //            }
            .navigationTitle("HBD Bro")
            .toolbar {
                Button {
                    isAddFriendView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $isAddFriendView) {
                    AddFriendView()
                }
            }
        }
        //        .tint(.black)
    }
    
    // 생일자 지우기 함수
    private func removeName(at indexSet: IndexSet) {
        for index in indexSet {
            context.delete(friends[index])
        }
    }
}

//MARK: 네비게이션링크 뷰
struct NavigationLinkView: View {
    let friend: Friends
    let isBirthday: Bool
    let todayYear = Calendar.current.component(.year, from: Date())
    
    var body: some View {
        let friendBirthdayYear = Calendar.current.component(.year, from: friend.birthday)
        let age = todayYear - friendBirthdayYear
        
        NavigationLink(destination: DetailView(isBirthday: isBirthday, friendName: friend.name, friendAge: age)) {
            HStack {
                if isBirthday {
                    Image(systemName: "birthday.cake.fill")
                        .foregroundStyle(.pink)
                }
                Text(friend.name)
                Spacer()
                Text(friend.birthday, format: .dateTime.month(.wide).day(.twoDigits).year())
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friends.self, inMemory: true)
}

