//
//  WidgetView.swift
//  richSwiftUI
//
//  Created by Appnap WS01 on 22/9/20.
//  Copyright © 2020 Appnap WS01. All rights reserved.
//

import SwiftUI
import WidgetKit


struct WidgetData {
    let weight: Measurement<UnitMass>
    let date: Date
}

extension WidgetData {
    static let previewData = WidgetData(weight: Measurement<UnitMass>(value: 77.5, unit: .kilograms), date: Date().advanced(by: (-60*29)))
}


struct WidgetView: View {
    var data: WidgetData
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        ZStack {
            Color(.yellow)
            HStack {
                VStack {
                    WeightView(data: data)
                        .padding(.all, 10)
                        .background(ContainerRelativeShape().fill(Color(.cyan)))
                    Spacer()
                    lastUpdatedView(data: data)
                }
                .padding(.all)
                if widgetFamily == .systemMedium {
                    Image("railLine")
                        .resizable()
                }
                
            }
        }
        
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WidgetView(data:
                .previewData)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            WidgetView(data:
                .previewData)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            WidgetView(data:
                .previewData)
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}

struct WeightView: View {
    var data: WidgetData
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Weight")
                    .font(.body)
                    .bold()
                    .foregroundColor(.green)
                Spacer()
                Text(MeasurementFormatter().string(from: data.weight))
                    .font(.title)
                    .bold()
                    .foregroundColor(.green)
                    .minimumScaleFactor(0.6)
            }
            Spacer()
        }
    }
    
}

struct lastUpdatedView: View {
    var data: WidgetData
    var body: some View {
        VStack(alignment: .leading) {
            Text("Last Updated")
                .font(.body)
                .bold()
                .foregroundColor(.green)
            Text("\(data.date, style: .relative) ago")
                .font(.caption)
                .foregroundColor(.green)
        }
        
    }
}
