//
//  LandmarkRow.swift
//  MacLandmarks
//
//  Created by 于鸿鹏 on 2022/8/19.
//  Copyright © 2022 于鸿鹏. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack(
            alignment:.center
        ) {
            landmark.image
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 32, height: 32, alignment: .center)
                .fixedSize(horizontal: true, vertical: false)
                .cornerRadius(4.0)
            VStack(alignment: .leading, spacing: 0) {
                Text(landmark.name)
                    .fontWeight(.bold)
                    .truncationMode(.tail)
                    .frame(minWidth: 20)
                Text(landmark.park)
                    .font(.caption)
                    .opacity(0.65)
                    .truncationMode(.middle)
            }
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarkData[0])
    }
}
