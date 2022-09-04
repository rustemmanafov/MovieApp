//
//  ListOfMovieGenres.swift
//  MovieApp
//
//  Created by Rustem Manafov on 02.09.22.
//

import UIKit

class ListOfMovieGenres: UIViewController {

    let viewModel = MovieModel()
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configViewModel()
    }
    
    func configViewModel() {
        viewModel.getList()
        viewModel.errorCallback = { message in
        }
        
        viewModel.successCallback = {
            self.tableView.reloadData()
        }
    }

}

extension ListOfMovieGenres: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as! MovieListCell
        cell.configure(data: viewModel.items[indexPath.row])
        return cell
    }
    
    
    
}
