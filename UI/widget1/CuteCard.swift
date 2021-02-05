//
//  CuteCard.swift
//  UI
//
//  Created by itiw on 4/2/21.
//

import SwiftUI

struct CuteCard: View {
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Text("blabu")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Image(systemName: "person.2")
                }
                Spacer()
                HStack{
                    Text("☺️")
                    Image(systemName: "car.2")
                }
            }
            Image("tigress")
        }
        .padding(10)
        .background(Color(red: 10/255, green: 255/255, blue: 200/255))
        .cornerRadius(10)
    }
}



