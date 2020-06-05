//
//  HomeView.swift
//  SayTheirNames
//
//  Created by Joseph A. Wardell on 6/2/20.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import UIKit

final class HomeView: UIView {

    let customNavigationBar: UIView = {
        let customNavigationBar = UIView()
        customNavigationBar.backgroundColor = .black
        return customNavigationBar
    }()
    
    lazy var locationCollectionView: UICollectionView = {
        let locationLayout = UICollectionViewFlowLayout()
        locationLayout.scrollDirection = .horizontal
        locationLayout.sectionInsetReference = .fromContentInset
        locationLayout.sectionInset = UIEdgeInsets(left: Theme.Components.Padding.medium, right: Theme.Components.Padding.medium)
        
        let locationCollectionView = UICollectionView(frame: .zero, collectionViewLayout: locationLayout)
        locationCollectionView.contentInsetAdjustmentBehavior = .always
        return locationCollectionView
    }()
    
    lazy var peopleCollectionView: UICollectionView = {
        let peopleLayout = UICollectionViewFlowLayout()
        peopleLayout.scrollDirection = .vertical
        peopleLayout.sectionInset = UIEdgeInsets.medium
        
        let peopleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: peopleLayout)
        peopleCollectionView.contentInsetAdjustmentBehavior = .always
        return peopleCollectionView
    }()
    
    let bookmarkButton: UIButton = {
        let bookmarkImage = UIImage(named: "white-bookmark")
        let bookmarkButton = UIButton(image: bookmarkImage)
        return bookmarkButton
    }()
    
    let searchButton: UIButton = {
        let searchButton = UIButton(type: .custom)
        let searchImage = UIImage(named: "white-search")
        searchButton.setImage(searchImage, for: .normal)
        return searchButton
    }()
    
    let separator: UIView! = {
        let separator = UIView()
        separator.backgroundColor = .systemGray6
        return separator
    }()
    
    func safeWidth(for collectionView: UICollectionView) -> CGFloat {
        let width = collectionView.frame.width -
            collectionView.safeAreaInsets.left -
            collectionView.safeAreaInsets.right -
            collectionView.layoutMargins.left -
            collectionView.layoutMargins.right
        
        let flowLayoutMargins: CGFloat
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayoutMargins = flowLayout.sectionInset.left + flowLayout.sectionInset.right
        }
        else {
            flowLayoutMargins = 0
        }
        
        return width - flowLayoutMargins
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        createLayout()
        backgroundColor = .black
    }
    
    private var hasLayedOutSubviews = false
    private func createLayout() {
        guard !hasLayedOutSubviews else { return }
        hasLayedOutSubviews = true
        createCustomNavigationBarLayout()
        addSubview(customNavigationBar)

        let collections = UIView()
        addSubview(collections)
        locationCollectionView.backgroundColor = .systemBackground
        peopleCollectionView.backgroundColor = .systemBackground
        customNavigationBar.anchor(
            superView: self,
            top: safeAreaLayoutGuide.topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            size: Theme.Screens.Home.NavigationBar.size)
        collections.anchor(
            superView: self,
            top: customNavigationBar.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor)
        
        locationCollectionView.anchor(
            superView: collections,
            top: collections.topAnchor,
            leading: collections.leadingAnchor,
            trailing: collections.trailingAnchor,
            size: Theme.Screens.Home.LocationView.size)
        separator.anchor(
            superView: collections,
            top: locationCollectionView.bottomAnchor,
            leading: collections.leadingAnchor,
            trailing: collections.trailingAnchor,
            size: Theme.Screens.Home.SeparatorView.size)
        peopleCollectionView.anchor(
            superView: collections,
            top: separator.bottomAnchor,
            leading: collections.leadingAnchor,
            bottom: collections.bottomAnchor,
            trailing: collections.trailingAnchor)
    }
    
    private func createCustomNavigationBarLayout() {
        let bar = customNavigationBar
        let label = UILabel()
        label.text = "SAY THEIR NAME"
        label.textColor = .white
        label.font = UIFont.STN.bannerTitle
        let buttonStack = UIStackView(arrangedSubviews: [bookmarkButton,searchButton])
        buttonStack.spacing = Theme.Components.Padding.small
        buttonStack.distribution = .fillEqually
        
        label.anchor(superView: bar,
                     leading: bar.leadingAnchor,
                     bottom: bar.bottomAnchor,
                     padding: .init(left: Theme.Components.Padding.medium, bottom: Theme.Components.Padding.medium))
        bar.addSubview(buttonStack)
        [bookmarkButton, searchButton].forEach {
            $0.widthAnchor.constraint(equalToConstant: Theme.Components.Button.Size.medium.height).isActive = true
            $0.heightAnchor.constraint(equalToConstant: Theme.Components.Button.Size.medium.width).isActive = true
        }
        buttonStack.anchor(superView: bar, trailing: bar.trailingAnchor, padding: .init(right: Theme.Components.Padding.medium))
        buttonStack.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true

    }
}
