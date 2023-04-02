//
//  TrailingIconLabelStyle.swift
//  AppleTutorial.Scrumdinger
//
//  Created by 後藤 子龍 on 2023/04/02.
//

import SwiftUI


struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
