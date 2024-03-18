//
//  RecommendList.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/18.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct RecommendList: View {
    
    var body: some View {
        NavigationView {
            List {
                ForEach((0...10), id: \.self) { post in
                    ZStack {
                        RecommendCell()
                        NavigationLink(
                            destination: RecommendCell(),
                            label: { })
                            .hidden()
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
            .navigationBarItems(leading: HomeCustomNavBar())
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct RecommendList_Previews: PreviewProvider {
    static var previews: some View {
        RecommendList()
    }
}
