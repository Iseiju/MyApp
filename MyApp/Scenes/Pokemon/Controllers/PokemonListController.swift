//
//  PokemonListController.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import UIKit

class PokemonListController: UIViewController {
	
	var viewModel: PokemonListViewModelProtocol?
	
	@IBOutlet private weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupTableView()
		getPokemons()
	}
	
	private func setupTableView() {
		tableView.register(R.nib.pokemonCell)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = UITableView.automaticDimension
	}
	
	private func getPokemons() {
		viewModel?.getPokemons() { [weak self] errorOrNil in
			guard let self = self, errorOrNil == nil else { return }
			
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
}

extension PokemonListController: UITableViewDelegate {}

extension PokemonListController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel?.cellViewModels.count ?? 0
	}
	
	func tableView(
		_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath
	) -> UITableViewCell {
		guard let pokemonCell = tableView
			.dequeueReusableCell(withIdentifier: R.reuseIdentifier.pokemonCell, for: indexPath),
					let cellViewModel = viewModel?.cellViewModels[indexPath.row]
		else { return UITableViewCell() }
		
		pokemonCell.cellViewModel = cellViewModel
		
		return pokemonCell
	}
}
