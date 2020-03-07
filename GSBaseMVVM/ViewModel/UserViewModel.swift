//
//  UserViewModel.swift
//  GSBaseMVVM
//
//  Created by Gati Shah on 25/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

//Business Logic
import Foundation

class UserViewModel {
    //MARK:- Variables
    typealias completionBlock = ([User]) -> ()
    var dataSourceArray = [User]()
    
    func getUserDataFromNetworkManager(url : EndPoint, completionBlock: @escaping completionBlock) {
        NetworkManager.request(showloader: true, url: url, method: .get, parameters: [:], responseString: ApiResponse.userData, success: { (response) in
            if let responseData = response {
                let arrayUser = try? JSONDecoder().decode([User].self, from: responseData)
                self.dataSourceArray = arrayUser ?? [User]()
                completionBlock(self.dataSourceArray)
            }
        }) { (error) in
            print("Failed to get User Data")
        }
    }
    
    func getNumberOfRowsInSection() -> Int {
        return dataSourceArray.count
    }
    
    func getUserAtIndex(index : Int) -> User {
        let user = dataSourceArray[index]
        return user
    }
}

