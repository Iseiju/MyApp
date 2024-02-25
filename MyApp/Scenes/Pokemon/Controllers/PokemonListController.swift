//
//  PokemonListController.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import RxSwift
import UIKit

class PokemonListController: UIViewController {
	
	var viewModel: PokemonListViewModelProtocol?
	
	private let disposeBag = DisposeBag()
	
	@IBOutlet private weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupTableView()
		setupBindings()
		getPokemons()
	}
	
	private func setupTableView() {
		tableView.register(R.nib.pokemonCell)
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = UITableView.automaticDimension
	}
	
	private func setupBindings() {
		viewModel?
			.cvmRelay
			.bind(to: tableView
				.rx
				.items(cellIdentifier: R.nib.pokemonCell.identifier,
							 cellType: PokemonCell.self)) { _, cvm, cell in
				cell.cellViewModel = cvm
			}.disposed(by: disposeBag)
	}
	
	private func getPokemons() {
		viewModel?.getPokemons() { [weak self] errorOrNil in
			DispatchQueue.main.async {
				self?.tableView.reloadData()
			}
		}
	}
}
