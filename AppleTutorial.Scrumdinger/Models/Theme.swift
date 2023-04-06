//
//  Theme.swift
//  AppleTutorial.Scrumdinger
//
//  Created by 後藤 子龍 on 2023/04/02.
//

import SwiftUI
enum Theme: String {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    //これはおそらく色の羅列なのだが、あまりスマートでないように見える。
    //ちゃんと模索したい。
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
            //文字の色の指定である。themeカラーが背景に表示される。でも、これtextカラーとかじゃダメだったのかな。
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    var mainColor: Color {
        switch self {
        case .orange:
            return Color.orange
        case .yellow:
            return Color.yellow
        default:
            return Color(rawValue)
            //上手にいかなかったので、自力で修正。rawvalueがうまく動いていなさそうな雰囲気だった。
        }
    }
    var name: String {
        rawValue.lowercased()
            //.capitalizedは、文字のサイズ規定を行っているようである。
        //調べたところ、英語にはキャピタライゼーションルールというのがあって、最初の一文字を大文字にするのをこれは表しているようだ。
        //このname、どうやらテーマカラーのnameらしい。
        //このcapitalizedは、themeのnameの単語を出してるみたい。変数名：型注釈{"AA"}みたいな構造なのでは？{}これが引数なのかどうかは不明。
    }
}

