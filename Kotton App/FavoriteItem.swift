//
//  FavoriteItem.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 11/3/23.
//

import Foundation

class FavoriteItem: Identifiable {
    var id = UUID()

    var isImportant = false

    init(isImportant: Bool = false) {
        self.isImportant = isImportant
    }

}
