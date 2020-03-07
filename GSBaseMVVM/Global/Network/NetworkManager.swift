//
//  NetworkManager.swift
//  GSBaseMVVM
//
//  Created by Gati Shah on 25/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let baseURL = "https://jsonplaceholder.typicode.com/"

let accepTableStatusCodes = 200 ... 299

let JsonEncodedURLs = ["EndPoint"]

enum EndPoint {
    
    case GetUserData
    
    var rawValue: String {
        get {
            switch self {
            case .GetUserData:
                return "posts"
            }
        }
    }
}

 class NetworkManager{
    
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    class func request(showloader : Bool,url : EndPoint,method : HTTPMethod,parameters : [String : Any], responseString : String,success:@escaping (Data?) -> Void,failure:@escaping (JSON?) -> Void){
        if isConnectedToInternet() {
            
            /*var param = parameters
            param[ApiKeys.lang] = Localize.currentLanguage()*/
            
            /*var headers = [ApiKeys.ContentType : ApiKeys.applicationJson]*/
            var encoding : ParameterEncoding = URLEncoding.default
            if method == .get {
                encoding = URLEncoding.default
            }
            /*if JsonEncodedURLs.contains(url.rawValue){encoding = JSONEncoding.default}*/
            /*print(headers)*/
            print(parameters)
            print(baseURL + url.rawValue)
            Alamofire.request(URL(string: baseURL + url.rawValue)!, method: method, parameters: parameters, encoding: encoding, headers: nil).responseJSON { response in
                print("\(responseString) \(response)")
                if let statusCode = response.response?.statusCode {
                    let responseJson = JSON(response.result.value as Any)
                    let status = accepTableStatusCodes.contains(statusCode)
                    switch status{
                    case true:
                        success(response.data)
                        break
                    default:
                        if let message = responseJson.dictionaryObject?[ApiKeys.message] as? String{
                             if !message.isEmpty{
                                 UIApplication.shared.windows.last?.showToast(toastMessage: message,duration: 0.3)
                             }
                         } else{
                        UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.Common.somethingWrong, duration: 0.3)
                            failure(nil)
                        }
                        failure(responseJson)
                        break
                    }
                }
            }
        } else {
            //display no internet available message
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.Common.noInternet, duration: 0.3)
            failure(nil)
        }
    }
    
    class func uploadImage(showloader : Bool,imgData : [Data],url : EndPoint,parameters : [String : Any],success:@escaping (JSON) -> Void, failure:@escaping (Error?) -> Void){
        if isConnectedToInternet() {
            Alamofire.upload(multipartFormData: { multipartFormData in
                
                for imageData in imgData{
                    multipartFormData.append(imageData, withName: "profile_picture",fileName: "file.jpg", mimeType: "image/jpg")
                }
                
                for (key, value) in parameters {
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }, to: baseURL + url.rawValue) { result in
                switch result {
                case .success(let upload, _, _):
                    
                    upload.uploadProgress(closure: { (progress) in
                        print("Upload Progress: \(progress.fractionCompleted)")
                    })
                    
                    upload.responseJSON { response in
                        print(response.result.value!)
                        let resJson = JSON(response.result.value!)
                        success(resJson)
                    }
                    
                case .failure(let encodingError):
                    print(encodingError)
                    let error : Error = encodingError
                    failure(error)
                }
            }
        } else {
            //display no internet available message
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.Common.noInternet, duration: 0.3)
            failure(nil)
        }
    }
 }
