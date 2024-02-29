//
//  CRKAlertPresenter.swift
//  GenericAlertPresenter
//
//  Created by Gabriel Castillo Serafim on 28/2/24.
//

import UIKit

protocol CRKAlertPresenterProtocol: AnyObject {
    func showAlert(type: CRKAlertTypes, inVC viewController: UIViewController)
}

// MARK: Alert presenter helper class
final class CRKAlertPresenter: CRKAlertPresenterProtocol {

    /// Method responsible for building and presenting alert
    /// _Here we could differentiate between mac and ios builds in order to build an alert type or another...
    func showAlert(type: CRKAlertTypes, inVC viewController: UIViewController) {
        
        // Get alert data
        let alertData = type.alertData
        
        // Build alert
        let alertController = UIAlertController(title: alertData.title, message: alertData.message, preferredStyle: alertData.preferredStyle)
        
        // Build and add alert actions
        if let alertActions = alertData.alertActions {
            
            alertActions.forEach { alertAction in
                let nativeAction = UIAlertAction(title: alertAction.title, style: alertAction.style, handler: makeAlertAction(alertAction.handler))
                alertController.addAction(nativeAction)
            }
        }
        
        // Show alert
        viewController.present(alertController, animated: true)
    }
    
    // MARK: Convenience wrapper
    // Wrapper to transform (() -> Void) function signature to ((UIAlertAction) -> Void)
    // This is used because the alert action handler requires a "UIAlertAction" return type but we never use it
    private func makeAlertAction(_ completion: (() -> Void)?) -> ((UIAlertAction) -> Void) {
        return { _ in completion?() }
    }
}
