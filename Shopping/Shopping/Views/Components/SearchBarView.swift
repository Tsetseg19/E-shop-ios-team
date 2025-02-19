//
//  SearchBarView.swift
//  Shopping
//
//  Created by Edwin Mbaabu on 2/13/25.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack{
            TextField("Search Furniture", text: .constant(""))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            Button(action: {}){
                Image(systemName: "qrcode.viewfinder")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchBarView()
}
