//
//  CRKAlertPresenter+Entities.swift
//  GenericAlertPresenter
//
//  Created by Gabriel Castillo Serafim on 28/2/24.
//

import UIKit

/// **Generic data used to build alerts  _Can be used for both mac and ios
struct CRKAlert {
    let title: String?
    let message: String?
    let preferredStyle: UIAlertController.Style /// Adapt this to support both mac and ios styles maybe
    let alertActions: [CRKAlertAction]?
}

struct CRKAlertAction {
    let title: String?
    let style: UIAlertAction.Style /// Adapt this to support both mac and ios styles maybe
    let handler: (() -> Void)?
}

// MARK: Add new alert types here... (Associated values are the completion handlers for the alert actions)
enum CRKAlertTypes {
    case redActionSheet(actionOneCompletion: () -> Void, actionTwoCompletion: () -> Void)
    case grayAlert(actionOneCompletion: () -> Void)
    case greenActionSheet(actionOneCompletion: () -> Void, actionTwoCompletion: () -> Void)
    // ..
    // ..
    // ..
}
