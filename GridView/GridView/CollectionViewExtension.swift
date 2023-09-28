//
//  CollectionViewExtension.swift
//  GridView
//
//  Created by 김주현 on 2023/09/28.
//

import Foundation
import UIKit

extension UICollectionView {
  
  func register<T>(xibCell type: T.Type) {
    register(UINib(nibName: String(describing: T.self), bundle: nil), forCellWithReuseIdentifier: String(describing: T.self))
  }
  
  func dequeueReusable<T>(cell type: T.Type, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
  }
}
