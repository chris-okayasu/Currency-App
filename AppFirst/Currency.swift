//
//  Currency.swift
//  AppFirst
//
//  Created by chris on 2024/08/17.
//
import SwiftUI
enum Currency: Double, CaseIterable, Identifiable{
    
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency { self }
    
    var img: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    var name: String{
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        
        // convertir a numeros
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        let convertedamount = (doubleAmount / self.rawValue) * currency.rawValue
        
       // print(convertedamount)
        
        return String(format: "%.2f", convertedamount)
    }
    
    
}

