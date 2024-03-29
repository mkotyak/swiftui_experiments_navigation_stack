import UIKit

enum UINavigationControllerConstants {
    static var isSwipeBackEnabled: Bool = true
}

///
/// Globally enables navigation with swipe back and make it depends on global constant
///
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1 && UINavigationControllerConstants.isSwipeBackEnabled
    }
}
