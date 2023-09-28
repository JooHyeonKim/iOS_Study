//
//  ViewController.swift
//  GridView
//
//  Created by 김주현 on 2023/09/28.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  var arr = Array(1...95)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    collectionView.collectionViewLayout = createLayout()
    collectionView.register(xibCell: NumCell.self)
    collectionView.dataSource = self
    collectionView.backgroundColor = .black
    //collectionView.delegate = self
  }
}

extension ViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    self.arr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusable(cell: NumCell.self, for: indexPath)
    let n = arr[indexPath.row]
    cell.configure(num: n)
    cell.layer.borderColor = UIColor.black.cgColor
    cell.layer.borderWidth = 1
    cell.number.font = UIFont.preferredFont(forTextStyle: .title1)
    cell.layer.cornerRadius = 12
    return cell
  }
}

extension ViewController {
  fileprivate func createLayout() -> UICollectionViewLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                          heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    
    let section = NSCollectionLayoutSection(group: group)
    
    let layout = UICollectionViewCompositionalLayout(section: section)
    
    return layout
  }

}

