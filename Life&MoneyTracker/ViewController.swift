//
//  ViewController.swift
//  Life&MoneyTracker
//
//  Created by kang on 26/7/2023.
//

import Cocoa

class ViewController: NSViewController {
    override func loadView() {
        // Create the view
        let view = NSView()
        view.wantsLayer = true

        // Create constraints for width and height
        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true

        // Set the view
        self.view = view
    }

    let timeLabel: NSTextField = {
        let label = NSTextField()
        label.isEditable = false
        label.isBordered = false
        label.backgroundColor = NSColor.clear
        label.stringValue = "Life Remaining: "
        return label
    }()
    
    let moneyLabel: NSTextField = {
        let label = NSTextField()
        label.isEditable = false
        label.isBordered = false
        label.backgroundColor = NSColor.clear
        label.stringValue = "Money Remaining: "
        return label
    }()
    
    let settingsButton: NSButton = {
        let button = NSButton(title: "设置", target: self, action: #selector(openSettings))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the labels and button to the view
        self.view.addSubview(timeLabel)
        self.view.addSubview(moneyLabel)
        self.view.addSubview(settingsButton)

        // Place the labels and button on the view
        timeLabel.frame = CGRect(x: 20, y: 60, width: 200, height: 20)
        moneyLabel.frame = CGRect(x: 20, y: 40, width: 200, height: 20)
        settingsButton.frame = CGRect(x: 12, y: 12, width: 80, height: 20)
        
        // Update the labels with data
        updateData()
    }
    
    func updateData() {
        // Get saved data from UserDefaults
        let currentAge = UserDefaults.standard.integer(forKey: "currentAge")
        let targetAge = UserDefaults.standard.integer(forKey: "targetAge")
        let moneyRemaining = UserDefaults.standard.double(forKey: "moneyRemaining")
        
        // Calculate life remaining
        let lifeRemainingDays = (targetAge - currentAge) * 365 // Assuming 365 days per year
        
        timeLabel.stringValue = "HP: \(lifeRemainingDays) 天"
        moneyLabel.stringValue = "Money: \(moneyRemaining) 元"
    }
    
    @objc func openSettings() {
        let settingsVC = SettingsViewController()
        self.presentAsModalWindow(settingsVC)
    }
}
