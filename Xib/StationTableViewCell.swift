//
//  StationTableViewCell.swift
//  Xib
//
//  Created by 古田翔太郎 on 2020/09/28.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {

    @IBOutlet var memo: UILabel!
    @IBOutlet var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(station: Station) {
      self.memo.text = station.memo as String
      self.date.text = station.date as String
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
