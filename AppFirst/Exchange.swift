//
//  Exchange.swift
//  AppFirst
//
//  Created by chris on 2024/08/20.
//

import SwiftUI

enum Exchange: Int, CaseIterable, Identifiable {
    case info1 = 1
    case info2 = 2
    case info3 = 3
    case info4 = 4
    var id: Exchange {self}
    
    var leftImg: ImageResource {
        switch self {
        case .info1:
                .goldpiece
        case .info2:
                .goldpenny
        case .info3:
                .silverpiece
        case .info4:
                .silverpenny
        }
    }

    var exchangeInfo: String{
        switch self {
        case .info1:
            "1 Gold Piece = 4 Gold Pennies"
        case .info2:
            "1 Gold Penny  = 4 Silver Pieces"
        case .info3:
            "1 Silver  Piece = 4 Silver Pennies"
        case .info4:
            "1 Silver Penny = 100 Cooper Pennies"
        }
    }
    
    var rightImg: ImageResource{
        switch self {
        case .info1:
                .goldpenny
        case .info2:
                .silverpiece
        case .info3:
                .silverpenny
        case .info4:
                .copperpenny
        }
    }
    
}
