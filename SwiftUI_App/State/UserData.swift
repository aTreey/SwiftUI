//
//  UserData.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2020/6/8.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}

