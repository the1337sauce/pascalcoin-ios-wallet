//
//  ViewController.swift
//  PascalCoinWallet
//
//  Created by Nathaniel Linsky on 1/9/18.
//  Copyright © 2018 Nathaniel Linsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  @IBOutlet weak var accountNumberTextField: UITextField!
  @IBOutlet weak var balanceLabel: UILabel!
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  @IBAction func fetchAccountInfoTapped(_ sender: UIButton) {
    let apiClient = PascalCoinApiClient()
    
    guard let accountNumberString = accountNumberTextField.text,
      let accountNumber = Int(accountNumberString) else {
      return
    }
    
    apiClient.fetchAccountInfo(accountNumber: accountNumber) { (account, error) -> () in
      guard let account = account else {
        if let error = error {
          print(error)
        }
        return
      }
      
      self.balanceLabel.text = String(account.balance)
    }
  }
}
