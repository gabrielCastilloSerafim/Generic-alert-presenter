//
//  CRKAlertPresenter+AlertsRepo.swift
//  GenericAlertPresenter
//
//  Created by Gabriel Castillo Serafim on 28/2/24.
//

import UIKit

extension CRKAlertTypes {
    
    // MARK: Define new alerts here...
    var alertData: CRKAlert {
        
        switch self {
            
        case .redActionSheet(let actionOneCompletion, let actionTwoCompletion):
            
            let alertActions = [
                CRKAlertAction(title: "Action One", style: .default, handler: actionOneCompletion),
                CRKAlertAction(title: "Action Two", style: .default, handler: actionTwoCompletion),
                CRKAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ]
            
            return CRKAlert(
                title: "My red action sheet",
                message: "This is a alert message",
                preferredStyle: .actionSheet,
                alertActions: alertActions)
            
        case .grayAlert(let actionOneCompletion):
            
            let alertActions = [
                CRKAlertAction(title: "Action One", style: .default, handler: actionOneCompletion),
                CRKAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ]
            
            return CRKAlert(
                title: "My gray alert",
                message: "This is a alert message",
                preferredStyle: .alert,
                alertActions: alertActions)
            
        case .greenActionSheet(let actionOneCompletion, let actionTwoCompletion):
            
            let alertActions = [
                CRKAlertAction(title: "Action One", style: .default, handler: actionOneCompletion),
                CRKAlertAction(title: "Action Two", style: .default, handler: actionTwoCompletion),
                CRKAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ]
            
            return CRKAlert(
                title: "My green action sheet",
                message: "This is a alert message",
                preferredStyle: .actionSheet,
                alertActions: alertActions)
        }
    }
}
