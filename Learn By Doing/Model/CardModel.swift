//
//  CardModel.swift
//  Learn By Doing
//
//  Created by Itunu Raimi on 22/02/2021.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    let title, headline, imageName, callToAction, message: String
    let gradientColors: [Color]
}
