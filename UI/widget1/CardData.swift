//
//  CardData.swift
//  UI
//
//  Created by itiw on 4/2/21.
//

import Foundation

struct CardData: Identifiable,Codable{
    var name : String
    var image : String
    var stats : [Stat]
    var id : String{name}
}
