//
//  Card.swift
//  AppleTutorial.Scrumdinger
//
//  Created by 後藤 子龍 on 2023/04/02.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    //DailyScrumのクラスファイル。定数宣言しているのにも関わらず、代入、初期化をしていないため、エラーが出る。
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                .padding(.trailing, 20)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    //配列の一番最初の要素を代入しているはずなので、カードビューはその要素を出すはず。
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}