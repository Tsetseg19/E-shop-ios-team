//
//  SectionHeaderView.swift
//  Shopping
//
//  Created by Edwin Mbaabu on 2/13/25.
//

import SwiftUI

struct SectionHeaderView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.horizontal)
    }
}

#Preview {
    SectionHeaderView(title: "Best Sellers")
}
