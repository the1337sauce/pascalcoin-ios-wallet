//
//  Models.swift
//  PascalCoinWallet
//
//  Created by Nathaniel Linsky on 1/9/18.
//  Copyright © 2018 Nathaniel Linsky. All rights reserved.
//

import Foundation


//An "Account object" is a JSON object with information about an account. Fields are:

//account : Integer - Account number
//enc_pubkey : HEXASTRING - Encoded public key value (See decodepubkey)
//balance : PASCURRENCY - Account balance
//n_operation : Integer - Operations made by this account (Note: When an account receives a transaction, n_operation is not changed)
//updated_b Integer - Last block that updated this account. If equal to blockchain blocks count it means that it has pending operations to be included to the blockchain.
//state : String - Values can be normal or listed. When listed then account is for sale
//locked_until_block : Integer - Until what block this account is locked. Only set if state is listed
//price : PASCURRENCY - Price of account. Only set if state is listed
//seller_account : Integer - Seller's account number. Only set if state is listed
//private_sale : Boolean - Whether sale is private. Only set if state is listed
//new_enc_pubkey : HEXSTRING - Private buyers public key. Only set if state is listed and private_sale is true
//name : String - Public name of account. Follows PascalCoin64 Encoding
//type : Integer - Type of account. Valid values range from 0..65535

enum AccountState: String {
  case Normal = "normal"
  case Listed = "listed"
}

struct Account {
    let number: Int
    let encPubkey: String
    let balance: Double
    let numberOfOperations: Int
    let updatedBlock: Int
    let state: AccountState
    let name: String
    let type: Int
    let lockedUntilBlock: Int?
    let price: Double?
    let sellerAccount: Int?
    let privateSale: Bool?
    let newEncPubkey: String?
}
