//
//  CommentTextView.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/15.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

/// 将UITextView封装成SwiftUI view
struct CommentTextView: UIViewRepresentable {
    
    /// 内容
    @Binding var text: String
    
    let beginEditingOnAppear: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UITextView()
        view.backgroundColor = .systemGray6
        view.font = .systemFont(ofSize: 18)
        view.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        view.delegate = context.coordinator
        view.text = text
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if beginEditingOnAppear,
           !uiView.isFirstResponder,
           !context.coordinator.didBecomeFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        let parent: CommentTextView
        var didBecomeFirstResponder: Bool = false
        init(_ view: CommentTextView) {
            parent = view
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}

struct CommentTextView_Previews: PreviewProvider {
    static var previews: some View {
        CommentTextView(text: .constant(""),beginEditingOnAppear: true)
    }
}
