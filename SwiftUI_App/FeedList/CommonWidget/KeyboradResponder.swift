//
//  KeyboradResponder.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/15.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI


/// 监听键盘响应, 遵守ObservableObject协议
class KeyboradResponder: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    var showKeyboard: Bool {
        keyboardHeight > 0
    }
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidden(_:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    func keyboardWillShow(_ notice: Notification) {
        guard let frame = notice.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        keyboardHeight = frame.size.height
    }
    
    @objc
    func keyboardWillHidden(_ notice: Notification) {

        keyboardHeight = 0
    }
}
