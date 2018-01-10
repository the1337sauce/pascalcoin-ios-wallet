//
//  PascalCoinAPIClient.swift
//  PascalCoinWallet
//
//  Created by Nathaniel Linsky on 1/9/18.
//  Copyright © 2018 Nathaniel Linsky. All rights reserved.
//

import Foundation
import Alamofire

enum APIClientError : Error {
  case NotFound(String)
}

class PascalCoinApiClient {

  init() {}
  
  func fetchAccountInfo(accountNumber: Int, completionHandler: @escaping (Account?, APIClientError?) -> ())  {
    let body: [String : Any] = [
      "jsonrpc" : "2.0",
      "method" : "getaccount",
      "id" : "123",
      "params" : ["account": accountNumber]
    ]
    
    Alamofire.request("http://80.24.12.98:4003", method: .post, parameters: body, encoding: JSONEncoding.default).responseJSON { response in
      
      guard let json = response.result.value as? [String: Any],
        let jsonResult = json["result"] as? [String: Any],
        let account = jsonResult["account"] as? Int,
        let encPubKey = jsonResult["enc_pubkey"] as? String,
        let balance = jsonResult["balance"] as? Double,
        let numberOfOperations = jsonResult["n_operation"] as? Int,
        let updatedBlock = jsonResult["updated_b"] as? Int,
        let stateString = jsonResult["state"] as? String,
        let state = AccountState(rawValue: stateString),
        let name = jsonResult["name"] as? String,
        let type = jsonResult["type"] as? Int else {
          return
      }
      
      completionHandler(Account(number: account, encPubkey: encPubKey, balance: balance, numberOfOperations: numberOfOperations, updatedBlock: updatedBlock, state: state, name: name, type: type, lockedUntilBlock: nil, price: nil, sellerAccount: nil, privateSale: nil, newEncPubkey: nil), nil)
    }
  }
  
}
