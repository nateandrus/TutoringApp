//
//  ChooseCreateViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class ChooseCreateViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var menteeButton: UIButton!
    @IBOutlet weak var mentorButton: UIButton!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mentorButton.layer.borderWidth = 2
        mentorButton.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        menteeButton.layer.cornerRadius = 5
        mentorButton.layer.cornerRadius = 5
    }
    
    func formatKeyboard() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
            guard let userInfo = notification.userInfo,
                let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            self.bottomConstraint.constant += keyboardFrame.height
            self.view.layoutSubviews()
            let frameInContentView = self.mentorButton.convert(self.mentorButton.bounds, to: self.contentView)
            let offSetPoint = CGPoint(x: self.contentView.frame.origin.x, y: frameInContentView.origin.y - frameInContentView.height)
            self.scroll.setContentOffset(offSetPoint, animated: true)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
            self.bottomConstraint.constant = 0
        }
    }
}
