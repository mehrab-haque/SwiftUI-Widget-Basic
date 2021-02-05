//
//  StatView.swift
//  UI
//
//  Created by itiw on 4/2/21.
//

import SwiftUI

struct StatView: View {
    
    let stat : Stat
    let width : CGFloat = 80.0
    
    var body: some View {
        VStack{
            Text("\(stat.percentage)%")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Image(systemName: stat.icon)
                .resizable()
                .renderingMode(.original)
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
                .frame(height:14)
            ZStack(alignment: .leading){
                Rectangle()
                    .foregroundColor(Color.gray)
                    .opacity(0.3)
                    .frame(width: width, height: 12.0)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: CGFloat((stat.percentage as NSString).floatValue)*width/100.0, height: 12.0)
            }
            .cornerRadius(4.0)
        }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(stat: Stat(percentage: "25.222", icon: "leaf.fill"))
    }
}
