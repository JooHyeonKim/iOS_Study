//
//  NumCell.swift
//  InsetItemsGrid
//
//  Created by 김주현 on 2023/10/04.
//

import UIKit

class NumCell: UICollectionViewCell {

  @IBOutlet weak var num: UILabel!
  
  func configure(n: String) {
    num.text = n
    num.font = UIFont.preferredFont(forTextStyle: .title1)
    self.contentView.backgroundColor = .darkGray
    self.layer.borderColor = UIColor.black.cgColor
    self.layer.borderWidth = 0
    self.layer.cornerRadius = 10
  }

}
