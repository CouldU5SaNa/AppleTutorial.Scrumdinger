//
//  Daily.swift
//  AppleTutorial.Scrumdinger
//
//  Created by 後藤 子龍 on 2023/04/02.
//

import Foundation
struct DailyScrum : Identifiable {
    let id : UUID
    var title: String
    var attendees: [Attendee]
    //このファイルの拡張のところでAttendee構造体を宣言している。自作だから色が違うくなってるぽい。
    var lengthInMinutes: Int
    var theme: Theme
    //別ファイルで定義されている。詳しくはTheme.swiftを見る必要がありそうだ。
    //このthemeは列挙型で、caseで色の名前を定義するとともに、変数を定義している。rawvalueだとそのcaseの名前を返すようだ。
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        //swiftのmapについてドキュメント読んでもわからん。何これ。
        //なんとなくだけど、Attendeeというリストの中身それぞれにnameという名前を付けてるっぽいな、$0は引数の省略の際用いられるものらしい。
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}
//構造体の定義を行う。これは、一つのスクラムを定義するときに必要な情報を定義している。
//self.attendees　というのは、this.num等、javaで定義している、インスタンス内の変数を宣言している。
//initはコンストラクタと同様で、初期値の代入を行っている。
//UUID = UUID() これをわざわざ宣言している意味がわからない。Quick Helpで確認しても空かっこの意味が直接書いてあるわけではないし…。要確認。
//UUIDとは、それ個別のナンバーを定義すること。ここだけ見ても何が上手にうまくいってるのかわからない。削除してエラーメッセージを確認してみたが、おそらくUUIDで自動生成ができているみたいだ。適当な関数を作って入力しても上手くいかないので、UUID ()という関数自体がfuncされているっぽい。
//Creates a UUID with RFC 4122 version 4 random bytes.
//self.id = id idはUUIDで型注釈されていたはずだが、idを代入できている。
//どうやらイニシャライザーの一部を削除すると、すべてのイニシャライザーが定義できていないと文句を言われるようだ。エラーコードは下。
/// Return from initializer without initializing all stored properties
/// 変数を宣言するとXcodeには何の型注釈で宣言されているか記録され、見せてくれるようだ。優しい。


extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
        //DailyScrum(title: ,attendees:[],lengthInMinutes:,theme:,)
    //イニシャライザーがあるにもかかわらず、空かっこのみで構造体の定義を行うと、エラーが出るようだ。
        // Missing arguments for parameters 'title', 'attendees', 'lengthInMinutes', 'theme' in call
        /// Expected ',' separator
        //代入なしで構造体作成してもエラーになる。どうやらイニシャライザーはデフォルトの値を入れるものどとは少し違うようだ。

    ]
    //構造体DailyScrumの拡張を行っている。最初のサンプルかな？扱い的には代入なんだけど。
}
