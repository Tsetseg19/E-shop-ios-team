//
//  PopularSectionCardView.swift
//  Shopping
//
//  Created by Edwin Mbaabu on 2/13/25.
//

import SwiftUI

struct FurnitureCardView: View {
    @State var product: ProductModel?
    
    @State private var isFavorite = false
    
    var body: some View {
        if let product = product {
            
            VStack(alignment: .leading, spacing: 10){
                ZStack(alignment: .topTrailing){
                    AsyncImage(url: URL(string: product.imageURL)){ phase in
                        switch phase{
                            case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipped()
                                .cornerRadius(10)
                        case .failure(_):
                            Color.gray.frame(height: 250).cornerRadius(10)
                            case .empty:
                            Color.gray.frame(height: 250).cornerRadius(10)
                        @unknown default:
                            Color.gray.frame(height: 250).cornerRadius(10)
                        }
                    }
                    
//                    Image(systemName: "heart.fill")
//                        .foregroundStyle(.red)
//                        .padding(8)
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
                        .padding(8)
                        .onTapGesture {
                            isFavorite.toggle()
                        }
                    
                    
                }
                
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        HStack(spacing: 3){
                            ForEach(0..<5){ index in
                                Image(systemName: index < product.stars ? "star.fill" : "star")
                                    .foregroundStyle(.yellow)
                                    .font(.title3)
                            }
                        }
                    }
                    Spacer()
                    Text(product.price)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
        }

    }
}

#Preview {
    FurnitureCardView(product: ProductModel(id: "1", name: "Medium Chair", price: "400", imageURL: "https://www.ikea.com/us/en/images/products/nordviken-chair-antique-stain__0832454_pe777681_s5.jpg?f=s", stars: 3, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."))
}




