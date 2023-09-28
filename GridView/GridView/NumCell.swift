//
//  NumCell.swift
//  GridView
//
//  Created by 김주현 on 2023/09/28.
//

import UIKit

class NumCell: UICollectionViewCell {

  @IBOutlet weak var number: UILabel!
  
  func configure(num: Int) {
    self.number.text = "\(num)"
  }

}
