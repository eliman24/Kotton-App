//
//  Models.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 10/31/23.
//

import Foundation
import SwiftUI

struct DataModel: Decodable {
    let error: String
    let message: String
    let data: [PostModel]
}

struct PostModel: Decodable {
    let id: Int
    let title: String
    let post: String
}
