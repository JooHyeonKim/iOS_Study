import UIKit
import RxSwift
import RxCocoa

class NewsVC: BaseViewController {
  var vm: NewsVM!
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    addCommonTopBar(title: "More", titlePosition: .left, showSeparator: true)
    setupCollectionView()
    bind()
  }
  
  private func setupCollectionView() {
    collectionView.collectionViewLayout = createCollectionViewLayout()
    collectionView.register(xibCell: NewsItem.self)
    collectionView.register(
      UINib(nibName: NewsHeader.className,bundle: nil),
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: NewsHeader.className)
    collectionView.dataSource = self
    collectionView.delegate = self
  }
  
  private func bind() {
    vm.news
      .observe(on: MainScheduler.instance)
      .bind{ [weak self] news in
        self?.collectionView.reloadData()
      }.disposed(by : loadBag)
  }
  
}

extension NewsVC: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return vm.news.value.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusable(cell: NewsItem.self, for: indexPath)
    let data = vm.news.value[indexPath.row]
    cell.configure(title: data.title, subtitle: data.createdAt.toString(.dotDateOnly))
      return cell
    }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: NewsHeader.className, for: indexPath) as! NewsHeader
    header.configure(title: "THOME News")
    
    return header
  }

}

extension NewsVC {
  fileprivate func createCollectionViewLayout() -> UICollectionViewLayout {
    let config = UICollectionViewCompositionalLayoutConfiguration()

    let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
      
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                            heightDimension: .estimated(100))
      
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 24, bottom: 100, trailing: 24)
      
      // 그룹 크기 및 그룹에 포함된 아이템 설정
      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                            heightDimension: .estimated(100)) // 그룹 높이 추정값
      
      let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
      group.interItemSpacing = .fixed(10) // 셀 간의 vertical한 패딩
      
      let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(60)) // 헤더 높이 추정값
      let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
      
      let section = NSCollectionLayoutSection(group: group)
      section.boundarySupplementaryItems = [sectionHeader]
      section.interGroupSpacing = 10
      return section
  }
    return layout
  }
}
