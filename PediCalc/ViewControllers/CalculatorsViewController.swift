//
//  CalculatorsViewController.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 05/02/21.
//

import UIKit

class CalculatorsViewController: UIViewController {
        
    var collectionView: UICollectionView?
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.backgroundColor = UIColor(named: "PrimaryColor")
        self.title = "PediCalc"
        
        setupPageControll()
        setupColletionView()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(CardColletionViewCell.self, forCellWithReuseIdentifier: "CalculatorCell")
        // Do any additional setup after loading the view.
        
        collectionView?.keyboardDismissMode = .onDrag
    }
    
    func setupPageControll() {
        view.addSubview(pageControl)
        
        pageControl.pageIndicatorTintColor = UIColor(named: "SecondColor")
        pageControl.currentPageIndicatorTintColor = UIColor(named: "ActionColor")
        
        pageControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setupColletionView() {
        let layout = CustomFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width * 0.65, height: view.frame.height * 0.45)
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 60
//        layout.minimumInteritemSpacing = view.frame.height / 5
        
        collectionView = CalculatorsCollectionView(frame: view.safeAreaLayoutGuide.layoutFrame, collectionViewLayout: layout)
        collectionView?.isScrollEnabled  = true
        collectionView?.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView ?? UICollectionView())
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: pageControl.topAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        collectionView?.keyboardDismissMode = .onDrag

    }
}

extension CalculatorsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalculatorCell", for: indexPath) as? CardColletionViewCell else { return UICollectionViewCell() }
        
        cell.calcView = BodySurfaceView()
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / view.frame.width * 1.5
        pageControl.currentPage = Int(scrollPos)
    }
}
