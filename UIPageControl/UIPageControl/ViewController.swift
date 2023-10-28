//
//  ViewController.swift
//  UIPageControl
//
//  Created by 김주현 on 2023/10/27.
//

import UIKit

class ViewController: UIViewController {
    var images = ["image1.gif", "image2.gif", "image3.png", "image4.png"]

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count //pagecontrol 동그라미 개수
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray //페이지표시색상
        pageControl.currentPageIndicatorTintColor = UIColor.black //현재페이지색상
        imageView.image = UIImage(named: images[0])
    }
    
    ///page가 변하면 호출됨
    @IBAction func pageChanged(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

