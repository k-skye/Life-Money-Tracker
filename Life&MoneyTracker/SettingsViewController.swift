//
//  SettingsViewController.swift
//  Life&MoneyTracker
//
//  Created by kang on 26/7/2023.
//

import Cocoa

class SettingsViewController: NSViewController {
    override func loadView() {
            // Create the view
            let view = NSView()
            view.frame = NSRect(x: 0, y: 0, width: 250, height: 100)
            view.wantsLayer = true

            // Set the view
            self.view = view
        }

    let currentAgeField: NSTextField = {
            let textField = NSTextField()
            textField.placeholderString = "Current Age"
            return textField
        }()

        let targetAgeField: NSTextField = {
            let textField = NSTextField()
            textField.placeholderString = "Target Age"
            return textField
        }()
        
        let moneyRemainingField: NSTextField = {
            let textField = NSTextField()
            textField.placeholderString = "Money Remaining"
            return textField
        }()
        
        let saveButton: NSButton = {
            let button = NSButton(title: "保存", target: self, action: #selector(saveSettings))
            return button
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            
            let currentAgeLabel: NSTextField = {
                let label = NSTextField()
                label.isEditable = false
                label.isSelectable = false
                label.stringValue = "现在岁数"
                return label
            }()

            let targetAgeLabel: NSTextField = {
                let label = NSTextField()
                label.isEditable = false
                label.isSelectable = false
                label.stringValue = "目标岁数"
                return label
            }()

            let moneyRemainingLabel: NSTextField = {
                let label = NSTextField()
                label.isEditable = false
                label.isSelectable = false
                label.stringValue = "剩余金钱"
                return label
            }()
            // Add the labels to the view
            self.view.addSubview(currentAgeLabel)
            self.view.addSubview(targetAgeLabel)
            self.view.addSubview(moneyRemainingLabel)
            
            // Add the fields and button to the view
            self.view.addSubview(currentAgeField)
            self.view.addSubview(targetAgeField)
            self.view.addSubview(moneyRemainingField)
            self.view.addSubview(saveButton)

            // Place the fields and button on the view
            currentAgeLabel.frame = CGRect(x: 20, y: 80, width: 100, height: 20)
            targetAgeLabel.frame = CGRect(x: 20, y: 60, width: 100, height: 20)
            moneyRemainingLabel.frame = CGRect(x: 20, y: 40, width: 100, height: 20)
            currentAgeField.frame = CGRect(x: currentAgeLabel.frame.maxX + 10, y: 80, width: 100, height: 20)
            targetAgeField.frame = CGRect(x: targetAgeLabel.frame.maxX + 10, y: 60, width: 100, height: 20)
            moneyRemainingField.frame = CGRect(x: moneyRemainingLabel.frame.maxX + 10, y: 40, width: 100, height: 20)
            saveButton.frame = CGRect(x: 20, y: 10, width: 80, height: 20)
            
            // Load the settings
            loadSettings()
        }
        
        func loadSettings() {
            let currentAge = UserDefaults.standard.integer(forKey: "currentAge")
            let targetAge = UserDefaults.standard.integer(forKey: "targetAge")
            let moneyRemaining = UserDefaults.standard.double(forKey: "moneyRemaining")
            
            currentAgeField.integerValue = currentAge
            targetAgeField.integerValue = targetAge
            moneyRemainingField.doubleValue = moneyRemaining
        }
        
        @objc func saveSettings() {
            UserDefaults.standard.set(currentAgeField.integerValue, forKey: "currentAge")
            UserDefaults.standard.set(targetAgeField.integerValue, forKey: "targetAge")
            UserDefaults.standard.set(moneyRemainingField.doubleValue, forKey: "moneyRemaining")
            
            // Log the money remaining
            let moneyLog = "Money remaining: \(moneyRemainingField.doubleValue)\n"
            let logURL = getDocumentsDirectory().appendingPathComponent("moneyLog.txt")
            if let logHandle = try? FileHandle(forWritingTo: logURL) {
                logHandle.seekToEndOfFile()
                logHandle.write(moneyLog.data(using: .utf8)!)
                logHandle.closeFile()
            } else {
                try? moneyLog.write(to: logURL, atomically: true, encoding: .utf8)
            }
            print(logURL)
            self.dismiss(nil)
        }
        
        func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
    
}
