//
//  UpcomingViewController.swift
//  themovies_project
//
//  Created by André Nogueira on 12/14/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UpcomingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            collectionView.delegate = self
        }
    }
    
    let numberOfCellsInRow: Int = 1
    var upcomingViewModel = UpcomingViewModel()
    let disposeBag = DisposeBag()
    var isLoad = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(R.nib.movieCollectionViewCell(), forCellWithReuseIdentifier: R.reuseIdentifier.movieCollectionViewCell.identifier)

        loadData()
        bind()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    
    
    func loadData() {
        if (isLoad) { return }
        isLoad = true
//        let page = self.catViewModel.cats_rx.value.count
        NetworkManager.shared.fetchGenrers { (genrers, error) in
            print(genrers)
        }
        NetworkManager.shared.fetchMovieList(page: 1, completion: { (movies, error) in
            self.upcomingViewModel.upcoming_movies.accept(self.upcomingViewModel.upcoming_movies.value + movies)
            self.isLoad = false
        })
    }
    
    func bind() {
        upcomingViewModel.upcoming_movies.bind(to: collectionView.rx.items(cellIdentifier: R.reuseIdentifier.movieCollectionViewCell.identifier,
                                                         cellType: MovieCollectionViewCell.self))
        { [weak self] row, movie, cell in
            cell.setupCell(name: movie.title, genre: movie.title, release_date: movie.release_date, id: movie.id)
            if (self == nil) { return }
//            if (row == self!.upcomingViewModel.upcoming_movies.value.count - 1) {
//                self?.loadData()
//            }
            }.disposed(by: self.disposeBag)
    
    }

}


extension UpcomingViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    //MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        guard let viewController = R.storyboard.main.catDogDetailsViewController()
//            else {
//                return
//        }
//
//        let dog = self.dogViewModel.dogs[indexPath.row]
//        viewController.dog = dog
//        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width - padding
        
        let numberOfCells = CGFloat(self.numberOfCellsInRow)
        let width = collectionViewSize / numberOfCells
        return CGSize(width: width, height: width)
        
    }
}

