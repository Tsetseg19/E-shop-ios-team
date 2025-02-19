//
//  ProductView.swift
//  Shopping
//
//  Created by Enkhtsetseg Unurbayar on 2/10/25.
//

import SwiftUI

struct ProductView: View {
    @State var selectedCatgory : String = "All"
    @StateObject var viewModel = ProductViewModel(networkManager: NetworkManager())
    
    let categories : [String] = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack (alignment: .leading, spacing: 20){
                    HStack{
                        Text("Find the \nBest")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                        + Text(" Furniture!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.orange)
                        
                        Spacer()
                        
                        Image(systemName: "person") ///the profile picture of our users
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal)
                    
                    ///Search Bar
                    SearchBarView()
                    
                    ///Categories
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 15){
                            ForEach(categories, id: \.self){
                                category in Text(category)
                                    .padding()
                                    .background(selectedCatgory == category ? Color.orange : Color(.systemGray6))
                                    .foregroundColor(selectedCatgory == category ? .white : .primary)
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        selectedCatgory = category
                                    }
                            }
                        }
                        
                    }
                    ///Popular section
                    SectionHeaderView(title: "Popular")
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            ForEach(viewModel.productList){product in
                                FurnitureCardView(product: product)
                            }
                        }
                        .padding(.horizontal)

                    }
                    
                    ///Best Section
                    SectionHeaderView(title: "Best")
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            ForEach(viewModel.productList){product in
                                FurnitureCardView(product: product)
                            }

                        }
                        .padding(.horizontal)
                    }
                }
            }
            .task {
                await viewModel.getproductList()
            }
        }
    }
}

#Preview {
    ProductView()
}
