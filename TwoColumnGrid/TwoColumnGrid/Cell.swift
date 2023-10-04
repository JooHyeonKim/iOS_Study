//
//  Cell.swift
//  TwoColumnGrid
//
//  Created by 김주현 on 2023/10/04.
//

import UIKit

class Cell: UICollectionViewCell {

  @IBOutlet weak var numLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  func configure(with num: String){
    numLabel.text = num
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.black.cgColor
  }

}
