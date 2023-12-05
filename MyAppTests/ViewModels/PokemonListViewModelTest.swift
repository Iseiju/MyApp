//
//  PokemonListViewModelTest.swift
//  MyAppTests
//
//  Created by Kenneth James Uy on 12/5/23.
//

@testable import MyApp
import XCTest

final class PokemonListViewModelTest: XCTestCase {
	
	func testGetPokemonsCalled() {
		let (sut, spy) = makeSpySut()
		
		sut.getPokemons() { _ in }
		
		XCTAssertEqual(spy.called, [.getPokemons])
	}
	
	func testGetPokemonsSuccess() {
		let (sut, mock) = makeMockSut()
		let stub = makePokemonStub()
		mock.pokemonsResult.result = .success(stub)
		
		sut.getPokemons() { _ in }
		
		XCTAssertFalse(sut.cellViewModels.isEmpty)
	}
	
	func testGetPokemonsFailure() {
		let (sut, mock) = makeMockSut()
		let stub = makePokemonStub()
		mock.pokemonsResult.result = .failure(.requestFailed)
		
		sut.getPokemons() { _ in }
		
		XCTAssertTrue(sut.cellViewModels.isEmpty)
	}
}

extension PokemonListViewModelTest {
	
	func makeSpySut() -> (PokemonListViewModel, PokemonAPISpy) {
		let spy = PokemonAPISpy()
		let sut = PokemonListViewModel(pokemonAPI: spy)
		
		return (sut, spy)
	}
	
	func makeMockSut() -> (PokemonListViewModel, PokemonAPIMock) {
		let mock = PokemonAPIMock()
		let sut = PokemonListViewModel(pokemonAPI: mock)
		
		return (sut, mock)
	}
	
	func makePokemonStub() -> [Pokemon] {
		let pokemon1 = Pokemon(
			name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"
		)
		
		let pokemon2 = Pokemon(
			name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"
		)
		
		return [pokemon1, pokemon2]
	}
}
