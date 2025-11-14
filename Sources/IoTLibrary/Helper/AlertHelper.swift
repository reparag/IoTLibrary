//
//  AlertHepler.swift
//  IoTLibrary
//
//  Created by Parag Patil on 14/11/25.
//

import UIKit

public class AlertHelper {

    @MainActor private static func topViewController(
        _ controller: UIViewController? = UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?.rootViewController
    ) -> UIViewController? {
        if let nav = controller as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = controller as? UITabBarController {
            return topViewController(tab.selectedViewController)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(presented)
        }
        return controller
    }

    /// Public method to show alert
    public static func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            guard let topVC = topViewController() else {
                print("⚠️ AlertHelper: No top view controller found.")
                return
            }

            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            topVC.present(alert, animated: true)
        }
    }
}
