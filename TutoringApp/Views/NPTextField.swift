//
//  NPTextField.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 5/8/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class NPTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        
        self.inputAccessoryView = toolbar
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    @objc private func dismissKeyboard() {
        self.resignFirstResponder()
    }
}




