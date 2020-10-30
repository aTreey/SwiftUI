//
//  WatchLandmarkDetail.swift
//  WatchLandmarks Extension
//
//  Created by 于鸿鹏 on 2020/9/17.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI

struct WatchLandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        Text("Hello World!")
    }
}

struct WatchLandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return WatchLandmarkDetail(landmark: userData.landmarks[0])
            .environmentObject(userData)
    }
}
