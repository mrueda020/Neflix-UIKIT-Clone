//
//  UpcomingViewController.swift
//  Neflix-Clone
//
//  Created by Miguel Rueda Carbajal on 10/06/22.
//

import UIKit

class UpcomingViewController: UIViewController {

    private var movies:[Movie] = [Movie]()
    
    private let upComingTable:UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.indentifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(upComingTable)
        upComingTable.delegate = self
        upComingTable.dataSource = self
        getUpComingMovies()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upComingTable.frame = view.bounds
    }
    
    
    private func getUpComingMovies() {
        APICaller.shared.getTrendingMovies  { results in
            switch results {
            case .success(let movies):
                self.movies = movies
                DispatchQueue.main.async {
                    self.upComingTable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.indentifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        let titleViewModel = TitleViewModel(title: movies[indexPath.row].original_title ?? "", posterURL: movies[indexPath.row].poster_path ?? "")
        
        cell.configure(with: titleViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
}
