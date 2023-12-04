//
//  PokemonCell.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import UIKit

class PokemonCell: UITableViewCell {
	
	var cellViewModel: PokemonListCellViewModelProtocol? {
		didSet {
			setData()
		}
	}

	@IBOutlet private weak var nameLabel: UILabel!

	private func setData() {
		nameLabel.text = cellViewModel?.name
	}
}
