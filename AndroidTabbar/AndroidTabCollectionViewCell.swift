//
//  AndroidTabCollectionViewCell.swift
//  AndroidTabbar
//
//  Created by Sagar Baloch on 10/07/2022.
//

import Foundation
import UIKit

class AndroidTabCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AndroidTabCollectionViewCell"
    
    override var isSelected: Bool {
        didSet{
            self.tabTitleLabel.textColor = isSelected ? .blue: .lightGray
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.backgroundOverlay.alpha = isHighlighted ? 0.5:0
        }
    }
    
    fileprivate lazy var backgroundOverlay: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        v.alpha = 0
        return v
    }()
    
    fileprivate lazy var tabTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .systemFont(ofSize: 14, weight: .medium)
        l.textColor = .lightGray
        l.numberOfLines = 2
        l.textAlignment = .center
        return l
    }()
    
    func set(text: String){
        self.tabTitleLabel.text = text
    }
    
    @objc private func tabItemSelected() {
        self.isSelected = true
    }
    
    private func setupViews() {
        self.backgroundColor = .white
        contentView.addSubview(backgroundOverlay)
        backgroundOverlay.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        backgroundOverlay.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        backgroundOverlay.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        backgroundOverlay.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(tabTitleLabel)
        tabTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tabTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        tabTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        tabTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
}
