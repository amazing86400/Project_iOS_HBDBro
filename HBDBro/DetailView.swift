//
//  DetailView.swift
//  HBDBro
//
//  Created by KIBEOM SHIN on 4/20/24.
//

import SwiftUI

struct DetailView: View {
    let isBirthday: Bool
    let friendName: String
    let friendAge: Int
    
    var body: some View {
        if isBirthday {
            ZStack(alignment: .center) {
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 350.0, height: 350.0)
                    .foregroundStyle(.white)
                    .shadow(radius: 30)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("오늘은")
                        Text("\(friendName)")
                            .font(.title3)
                            .bold()
                        Text("님의")
                        Text("\(friendAge)")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.pink)
                        Text("번째 생일입니다.")
                        Spacer()
                    }
                    .padding()
                    
                    Text("\(friendName)님에게 축하 메시지를 보내보세요!")
                        .padding(.bottom, 50)
                    
                    Spacer()
                }
            }
            .background(.pink)
        } else {
            VStack {
                HStack {
                    Text("\(friendName)")
                        .font(.title3)
                        .bold()
                    Text("님은 생일이 아니에요.")
                }
            }
        }
    }
}

#Preview {
    DetailView(isBirthday: false, friendName: "신기범", friendAge: 26)
}
