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
    
    
    var cellsPerRow:CGFloat = 2
    let cellPadding:CGFloat = 5
    var upcomingViewModel = UpcomingViewModel()
    let disposeBag = DisposeBag()
    
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
        
        let group = DispatchGroup()
        
        ////////////////////////////////////////////////////////////////
        //MARK:-
        //MARK: Should get genres first
        //MARK:-
        ////////////////////////////////////////////////////////////////
        
        group.enter()
        GenresManager.shared.fetchGenres { (success) in
            group.leave()
        }
        
        
        ////////////////////////////////////////////////////////////////
        //MARK:-
        //MARK:should get upcoming movies list
        //MARK:-
        ////////////////////////////////////////////////////////////////
        
        group.enter()
        upcomingViewModel.fetchMovies { (success) in
            group.leave()
        }
    }
    
    
    func bind() {
        upcomingViewModel.upcoming_movies.bind(to: collectionView.rx.items(cellIdentifier: R.reuseIdentifier.movieCollectionViewCell.identifier,
                                                                           cellType: MovieCollectionViewCell.self))
        { [weak self] row, movie, cell in
            
            
            guard let str_genres = GenresManager.shared.buildGenreStr(movie: movie)
                else{
                    return
            }
            
            cell.setupCell(name: movie.title, genre: str_genres, release_date: movie.release_date, id: movie.id)
            
            
            cell.setupImage(path: movie.poster_path)
            if (self == nil) { return }
            if (row == self!.upcomingViewModel.upcoming_movies.value.count - 1) {
                self?.loadData()
            }
            }.disposed(by: self.disposeBag)
        
        Observable.zip(collectionView.rx.itemSelected, collectionView.rx.modelSelected(Movie.self))
            .bind { [weak self] (indexpath, movie) in
                
                let modalViewController = R.storyboard.detail.detailMovieModalViewController()
                if let modalVC = modalViewController{
                    modalVC.movie = movie
                    modalVC.genres_dict = GenresManager.shared.dictionary_genres
                    self?.navigationController?.pushViewController(modalVC, animated: true)
                }
                
            }.disposed(by: disposeBag)
        
    }
    
    
}
extension UpcomingViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthMinusPadding = UIScreen.main.bounds.width - (cellPadding + cellPadding * cellsPerRow)
        let eachSide = widthMinusPadding / cellsPerRow
        return CGSize(width: eachSide, height: eachSide)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        cellsPerRow = (traitCollection.verticalSizeClass == .compact) ? 2 : 1
        collectionView.reloadData()
    }
}
