//
//  ViewController.swift
//  InsetItemsGrid
//
//  Created by 김주현 on 2023/10/04.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var viewController: UICollectionView!
  var numbers = Array(1...100)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewController.collectionViewLayout = createLayout()
    viewController.register(UINib(nibName: "NumCell", bundle: nil), forCellWithReuseIdentifier: "NumCell")
    viewController.dataSource = self
    viewController.delegate = self
  }
}

extension ViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.numbers.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = viewController.dequeueReusableCell(withReuseIdentifier: "NumCell", for: indexPath) as? NumCell else { return UICollectionViewCell() }
    cell.configure(n: "\(self.numbers[indexPath.row])")
    return cell
  }
}

extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    return
  }
}

extension ViewController {
  fileprivate func createLayout() -> UICollectionViewLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.333333333),
                                          heightDimension: .fractionalHeight(1.0))
    let item  = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .fractionalWidth(0.3))
    
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    //group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    
    let section = NSCollectionLayoutSection(group: group)
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
  }
}

