//
//  ViewController.swift
//  AndroidTabbar
//
//  Created by Sagar Baloch on 10/07/2022.
//

import UIKit

class AndroidTabbarController: UIViewController {
    
    private var tabbarTitleSize: CGSize {
        return CGSize(width: (Double(view.frame.width)/Double(controllers.count))*0.95, height: 50)
    }
    
    fileprivate var controllers = [
        AndroidTabbarModel(viewController: UIViewController(), title: "First"),
        AndroidTabbarModel(viewController: UIViewController(), title: "Second"),
        AndroidTabbarModel(viewController: UIViewController(), title: "Third")
    ]
    
    fileprivate lazy var tabBarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = tabbarTitleSize
        
        let c = UICollectionView(frame: .zero, collectionViewLayout: layout)
        c.translatesAutoresizingMaskIntoConstraints = false
        c.heightAnchor.constraint(equalToConstant: 50).isActive = true
        c.register(AndroidTabCollectionViewCell.self, forCellWithReuseIdentifier: AndroidTabCollectionViewCell.identifier)
        c.dataSource = self
        c.delegate = self
        c.backgroundColor = .white
        c.allowsMultipleSelection = false
        c.isScrollEnabled = false
        //by default first item will be selected
        c.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .top)
        return c
    }()
    
    fileprivate lazy var selectedTabBottomBarView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 2).isActive = true
        v.backgroundColor = .blue
        return v
    }()
    
    fileprivate lazy var tabBottomBorderView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.heightAnchor.constraint(equalToConstant: 2).isActive = true
        v.backgroundColor = .lightGray
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tabBarCollectionView)
        tabBarCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tabBarCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        tabBarCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        
        view.addSubview(tabBottomBorderView)
        tabBottomBorderView.bottomAnchor.constraint(equalTo: tabBarCollectionView.bottomAnchor).isActive = true
        tabBottomBorderView.widthAnchor.constraint(equalTo: tabBarCollectionView.widthAnchor).isActive = true
        tabBottomBorderView.centerXAnchor.constraint(equalTo: tabBarCollectionView.centerXAnchor).isActive = true
        
        view.addSubview(selectedTabBottomBarView)
        selectedTabBottomBarView.bottomAnchor.constraint(equalTo: tabBarCollectionView.bottomAnchor).isActive = true
        selectedTabBottomBarView.widthAnchor.constraint(equalToConstant: tabbarTitleSize.width).isActive = true
        selectedTabBottomBarView.leftAnchor.constraint(equalTo: tabBarCollectionView.leftAnchor).isActive = true
    }
    
}

extension AndroidTabbarController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AndroidTabCollectionViewCell.identifier, for: indexPath) as! AndroidTabCollectionViewCell
        cell.set(text: controllers[indexPath.row].title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.animateBottomBar(to: indexPath.row)
    }
    
    fileprivate func animateBottomBar(to index: Int) {
        let xValue = self.tabbarTitleSize.width * CGFloat(index)
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) { [weak self] in
            self?.selectedTabBottomBarView.transform = CGAffineTransform(translationX: xValue, y: 0)
        }
    }
    
}
