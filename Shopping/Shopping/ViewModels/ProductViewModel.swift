//
//  ProductViewModel.swift
//  Shopping
//
//  Created by Enkhtsetseg Unurbayar on 2/10/25.
//
import Foundation

final class ProductViewModel : ObservableObject {
    @Published var productList : [ProductModel] = []
    
    let networkManager : NetworkManagerProtocol
    
    init(networkManager : NetworkManagerProtocol){
        self.networkManager = networkManager
    }
    
    func getproductList() async{
        let urlPath : String = "products"
        do{
            let productData = try await self.networkManager.fetchData(urlPath: urlPath, modelType: [ProductModel].self)
            
            DispatchQueue.main.async{ [weak self] in
                self?.productList = productData
            }
        }catch{
            print("Error: \(error.localizedDescription)")
        }
    }
}
