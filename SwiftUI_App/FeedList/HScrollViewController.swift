//
//  HScrollViewController.swift
//  SwiftUI_App
//
//  Created by 480814177@qq.com on 2021/1/14.
//  Copyright © 2021 480814177@qq.com. All rights reserved.
//

import SwiftUI

struct HScrollViewController<Content: View>: UIViewControllerRepresentable {
    
    let pageWidth: CGFloat
    let contentSize: CGSize
    let content: Content
    @State var leftPresent: CGFloat = 0
    
    init(pageWidth: CGFloat, contentSize: CGSize, @ViewBuilder content: () -> Content) {
        self.pageWidth = pageWidth
        self.contentSize = contentSize
        self.content = content()
    }
    
    // 协议
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        context.coordinator.scrollView = scrollView
        
        let vc = UIViewController()
        vc.view.addSubview(scrollView)
        
        let hostVc = UIHostingController(rootView: content)
        vc.addChild(hostVc)
        scrollView.addSubview(hostVc.view)
        hostVc.didMove(toParent: vc)
        context.coordinator.host = hostVc

        return vc
    }
    
    // 更新UI
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        let scrollView = context.coordinator.scrollView!
        scrollView.frame = CGRect(x: 0, y: 0, width: pageWidth, height: contentSize.height)
        scrollView.contentSize = contentSize
        scrollView.setContentOffset(CGPoint(x: leftPresent * (contentSize.width - pageWidth), y: 0), animated: true)
        context.coordinator.host.view.frame = CGRect(origin: .zero, size: contentSize)
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: HScrollViewController
        var scrollView: UIScrollView!
        var host: UIHostingController<Content>!
        
        init(_ parent: HScrollViewController) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            print("scrollViewDidScroll --- %f", scrollView.contentOffset.x)
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            print("scrollViewDidEndDecelerating")
        }
    }
}
