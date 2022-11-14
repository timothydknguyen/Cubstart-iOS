//
//  CardListViewModel.swift
//  Quizlet-ish
//
//  Created by Timothy Nguyen on 11/13/22.
//

import Foundation
@Published var cardViewModels: [CardViewModel] = []
private var cancellables: Set<AnyCancellable> = []

init() {
  cardRepository.$cards.map { cards in
    cards.map(CardViewModel.init)
  }
  .assign(to: \.cardViewModels, on: self)
  .store(in: &cancellables)
}
