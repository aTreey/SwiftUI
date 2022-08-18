//
//  LandmarkList.swift
//  MacLandmarks
//
//  Created by 于鸿鹏 on 2022/8/19.
//  Copyright © 2022 于鸿鹏. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject private var userData: UserData;
    
    var body: some View {
        List {
            ForEach(userData.landmarks) { landmark in
                LandmarkRow(landmark: landmark)
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(UserData())
    }
}
