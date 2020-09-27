//
//  Station.swift
//  Xib
//
//  Created by 古田翔太郎 on 2020/09/28.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

import Foundation

class Station : NSObject {
  var memo: String
  var date: String

  init(memo: String, date: String){
    self.memo = memo as String
    self.date = date as String
  }
}
