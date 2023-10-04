//
//  ViewController.swift
//  TwoColumnGrid
//
//  Created by 김주현 on 2023/10/04.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  let data = Array(1...18)
  
  override func viewDidLoad() {
        super.viewDidLoad()
    setupCollectionView()
    }
  
  func setupCollectionView() {
    self.collectionView.collectionViewLayout = createLayout()
    collectionView.register(UINib(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    collectionView.dataSource = self
    collectionView.isScrollEnabled = false
  }
}

extension ViewController: UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? Cell else { return UICollectionViewCell()}
    cell.configure(with: String(self.data[indexPath.row]))
    return cell
  }
}

extension ViewController {
  fileprivate func createLayout() -> UICollectionViewLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                          heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .absolute(44))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
    let spacing = CGFloat(10)
    group.interItemSpacing = .fixed(spacing)
    
    let section = NSCollectionLayoutSection(group: group)
    section.interGroupSpacing = spacing
    section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
    
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
  }
}
