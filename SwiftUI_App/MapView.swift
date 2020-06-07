//
//  MapView.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2019/8/6.
//  Copyright © 2019 于鸿鹏. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {
    // 地标坐标
    var coordinate: CLLocationCoordinate2D
    
    typealias UIViewType = MKMapView
    // 创建mapView
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MapView.UIViewType {
        return MKMapView(frame: .zero)
    }
    
    // 配置view 响应事件，给 map view 设置坐标，
    func updateUIView(_ uiView: MapView.UIViewType, context: UIViewRepresentableContext<MapView>) {
        // 地图的宽和高
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}


#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
#endif
