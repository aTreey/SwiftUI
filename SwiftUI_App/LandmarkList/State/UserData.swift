//
//  UserData.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2020/6/8.
//  Copyright © 2020 480814177@qq.com. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}

