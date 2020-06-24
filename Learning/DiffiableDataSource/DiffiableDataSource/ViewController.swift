//
//  ViewController.swift
//  DiffiableDataSource
//
//  Created by mac on 23/06/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

enum Section{
    case section1
    case section2
}

struct Item:Hashable{
    let color:UIColor
}

class ViewController: UIViewController , UICollectionViewDelegate{
    
    

    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
        }
    }
    
    lazy var cellProvider: (UICollectionView, IndexPath, Item) -> UICollectionViewCell? = { collectionView, indexPath, item in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = item.color
        return cell
    }
    
    lazy var datasource = UICollectionViewDiffableDataSource<Section,Item>(collectionView: self.collectionView, cellProvider: self.cellProvider)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let items1 = [
                Item(color: .green),
                Item(color: .red),
                Item(color: .blue)
            ]
            
            let items2 = [
                Item(color: .yellow),
                Item(color: .orange),
                Item(color: .purple)
            ]
            
            addItems(items: items1, to: .section1)
            addItems(items: items2, to: .section2)
        }
    }

   


extension ViewController {
    func addItems(items: [Item], to section: Section) {
        var snapshot = datasource.snapshot()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        datasource.apply(snapshot)
    }
}
