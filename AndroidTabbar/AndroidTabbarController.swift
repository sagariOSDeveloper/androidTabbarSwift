//
//  ViewController.swift
//  AndroidTabbar
//
//  Created by Sagar Baloch on 10/07/2022.
//

import UIKit

class AndroidTabbarController: UIViewController {
    
    fileprivate lazy var tabBarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
        c.translatesAutoresizingMaskIntoConstraints = false
        c.heightAnchor.constraint(equalToConstant: 50).isActive = true
        c.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ".identifier")
        c.dataSource = self
        c.delegate = self
        c.backgroundColor = .white
        c.allowsMultipleSelection = false
        c.isScrollEnabled = false
        //by default first item will be selected
        c.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .top)
        return c
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
}

extension AndroidTabbarController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
