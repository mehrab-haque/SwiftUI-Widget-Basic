//
//  widget1.swift
//  widget1
//
//  Created by itiw on 4/2/21.
//

import WidgetKit
import SwiftUI


let stats = [
    Stat(percentage: "20.22", icon: "sun.max.fill"),
    Stat(percentage: "80.22", icon: "leaf.fill"),
    Stat(percentage: "25.22", icon: "bell.circle.fill")
]

let cardData = CardData(name: "gaby", image: "tigress", stats: stats)


struct WidgetModel : TimelineEntry {
    var date : Date
    var cardData : CardData
}

struct DataProvider: TimelineProvider {
    func getSnapshot(in context: Context, completion: @escaping (WidgetModel) -> Void) {
        let entry = WidgetModel(
            date: Date(),
            cardData: cardData
        )
        completion(entry)
    }
    
    func placeholder(in context: Context) -> WidgetModel {
        let entry = WidgetModel(
            date: Date(),
            cardData: cardData
        )
        return entry
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetModel>) -> Void) {
        let entry = WidgetModel(
            date: Date(),
            cardData: cardData
        )
        let timeline = Timeline(
            entries:[entry],
            policy: .atEnd
        )
        completion(timeline)
    }
}




struct widget1EntryView : View {
    var entry: DataProvider.Entry
    
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        
        switch family {
        case .systemLarge :
            VStack{
                HStack{
                    HStack{
                        Text(entry.cardData.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Image(systemName: "person.2")
                    }
                    Spacer()
                    HStack{
                        Text("☺️")
                        Image(systemName: "car.2")
                    }
                }
                Spacer()
                Image(entry.cardData.image)
                    .resizable()
                    .frame(width: 140, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
           
                Spacer()
                HStack{
                    ForEach(entry.cardData.stats){ stat in
                        Spacer()
                        StatView(stat: stat)
                    }
                    Spacer()
                }
            }
            .padding(26)
            .background(Color(red: 200/255, green: 255/255, blue: 240/255))
            
        case .systemMedium :
            HStack{
                ForEach(entry.cardData.stats){ stat in
                    Spacer()
                    StatView(stat: stat)
                }
                Spacer()
            }
            .padding(32)
            .background(Color(red: 200/255, green: 255/255, blue: 240/255))
            
        case .systemSmall :
            SmallLayout(cardData: cardData)
        }
        
        
    }
    
}

struct SmallLayout : View {
    
    let cardData : CardData
    
    var body : some View {
        VStack{
            StatView(stat: cardData.stats[0])
        }
        .padding(32)
        .background(Color(red: 200/255, green: 255/255, blue: 240/255))
    }
}

@main
struct widget1: Widget {
    let kind: String = "widget1"

    var body: some WidgetConfiguration {
        
        
        StaticConfiguration(kind: "Widget", provider: DataProvider()) { data  in
            widget1EntryView(entry: data)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct widget1_Previews: PreviewProvider {
    static var previews: some View {
        widget1EntryView(entry: WidgetModel(date: Date(), cardData: cardData))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
