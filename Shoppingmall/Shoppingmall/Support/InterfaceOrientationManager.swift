//
//  InterfaceOrientationManager.swift
//  Shoppingmall
//
//  Created by Никита Пивоваров on 04.10.2023.
//

import SwiftUI

public extension View {
    func onInterfaceOrientationChange(perform: @escaping (UIInterfaceOrientation) -> Void) -> some View {
        modifier(OnInterfaceOrientationChangeViewModifier(onChange: perform))
    }
}

private struct OnInterfaceOrientationChangeViewModifier: ViewModifier {
    let onChange: (UIInterfaceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content.background(OnInterfaceOrientationChangeView(onChange: onChange))
    }
}

private struct OnInterfaceOrientationChangeView: UIViewControllerRepresentable {
    let onChange: (UIInterfaceOrientation) -> Void
    
    func makeUIViewController(context: Context) -> OnInterfaceOrientationChangeViewController {
        OnInterfaceOrientationChangeViewController(onChange: onChange)
    }
    
    func updateUIViewController(_ uiViewController: OnInterfaceOrientationChangeViewController, context: Context) {}
}

private final class OnInterfaceOrientationChangeViewController: UIViewController {
    init(onChange: @escaping (UIInterfaceOrientation) -> Void) {
        self.onChange = onChange
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    let onChange: (UIInterfaceOrientation) -> Void
    var lastOrientation: UIInterfaceOrientation?
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        perform()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        perform()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        perform()
    }
    
    func perform() {
        guard let orientation = view.window?.windowScene?.interfaceOrientation else { return }
        guard lastOrientation == nil || lastOrientation != orientation else { return }
        lastOrientation = orientation
        onChange(orientation)
    }
}
