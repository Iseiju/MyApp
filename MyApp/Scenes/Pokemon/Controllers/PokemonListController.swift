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
		
		tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
			let item = self?.viewModel?.cvmRelay.value[indexPath.row]
			self?.presentAlert(title: item?.name ?? "")
		}).disposed(by: disposeBag)
	}
	
	private func getPokemons() {
		viewModel?.getPokemons() { [weak self] errorOrNil in
			DispatchQueue.main.async {
				self?.tableView.reloadData()
			}
		}
	}
	
	private func presentAlert(title: String) {
		let alertController = UIAlertController(
			title: title, message: "", preferredStyle: .alert
		)
		
		let okay = UIAlertAction(title: "Okay", style: .default) { _ in
			print(title)
		}
		
		alertController.addAction(okay)
		
		present(alertController, animated: true)
	}
}
