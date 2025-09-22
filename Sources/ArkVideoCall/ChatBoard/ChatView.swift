//
//  ChatView.swift
//  ArkVideoCallDemo
//
//  Created by ArkSigner ArkSigner on 23.12.2022.
//  Copyright © 2022 ArkSigner ArkSigner. All rights reserved.
//

import UIKit
import CoreFoundation


public class ChatView: UIView, UITextFieldDelegate {
    
    public var tableView = UITableView()
    public var messView = UIView()
    public var leadingConstraint: NSLayoutConstraint!
    public var trailingConstraint: NSLayoutConstraint!
    public var keyboardHeight:CGFloat? = 0
    
    public var txtMesage:UITextField = {
        let txtField = UITextField()
        txtField.borderStyle = .roundedRect
        txtField.clipsToBounds = true
        txtField.layer.cornerRadius = 15.0
        txtField.placeholder = " ... "
        txtField.keyboardType = .asciiCapable
        txtField.spellCheckingType = .no
        txtField.autocorrectionType = .no
        txtField.returnKeyType = .done
    return txtField }()
    
    public var btnSend:UIButton = {
        let btn = UIButton(type:.system)
        btn.setBackgroundImage(UIImage(named: "btnSend"), for: .normal)
        btn.addTarget(self, action: #selector(SendBtnActions), for: .touchUpInside)
    return btn }()

    public func scrollTableViewAutomaticaly() {
        if messages.count > 0 {
            if isChatTableVisible == true {
                var contentInsets:UIEdgeInsets
                contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0, right: 0.0);
                tableView.contentInset = contentInsets
                let indexPath = IndexPath(row: 0, section: tableView.numberOfSections-1)
                tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
                tableView.scrollIndicatorInsets = tableView.contentInset
            }
        }
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtMesage.resignFirstResponder()
        clickReturnBtnOnKeyboard()
        return true
    }
    
    public func clickReturnBtnOnKeyboard() {
//        print("Return button clicked")
        NotificationCenter.default.post(name: Notification.Name("reduceViewController"), object: nil)
        isChatTableVisible = false
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 130
        let currentString: NSString = (txtMesage.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    @objc public func SendBtnActions() {
        if ((txtMesage.text != "") && (txtMesage.text != " ") && (txtMesage.text != "  ") && (txtMesage.text != "   ")) {
            NotificationCenter.default.post(name: Notification.Name("SendMessageBtnActions"), object: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(50)) { [self] in
               
                let dateFormatter : DateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
                let date = Date()
                
                let msgDate = dateFormatter.string(from: date)
                
                let messageBody = combinedMessage(cText: txtMesage.text!, cIsInComing: false, cTime: date)
                combinedMessages[msgDate] = messageBody
                self.combineAllMessages()
                self.tableView.reloadData()
                txtMesage.text = ""
                scrollTableViewAutomaticaly()
            }
        } else {
            txtMesage.text = ""
        }
    }
    
    public func combineAllMessages() {
        messages = [[Message]]()
        var index = 0
        for (key, value) in combinedMessages.sorted(by: {$0.value.cTime.compare($1.value.cTime) == .orderedAscending}) {
            messageList[index] = ["Text": String(), "isInComing": Bool(), "Time": String()]
            let combinerMsgList = Message(text: value.cText, isInComing: value.cIsInComing, time: value.cTime)
            messages.append([combinerMsgList])
            index += 1
        }
        tableView.reloadData()
        scrollTableViewAutomaticaly()
    }
    
    @objc public func keyboardWillShow(notification:NSNotification) {
            if let keyboardRectValue = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                keyboardHeight = keyboardRectValue.height
                updateFrame()
                NotificationCenter.default.post(name: Notification.Name("raiseViewController"), object: nil)
            }
    }
    
    public func getKeyboardHeight() {
        NotificationCenter.default.addObserver(self, selector: .keyboardWillShow, name: UIResponder.keyboardWillShowNotification, object: nil)
        txtMesage.becomeFirstResponder()
    }

    public func updateFrame() {
        let screenHeight = self.frame.size.height
        let screenWidth = self.frame.size.width

        messView.frame = CGRect(x: 0, y: screenHeight-(keyboardHeight ?? 00)-screenHeight*0.05, width: screenWidth, height: screenHeight*0.05)
        txtMesage.frame = CGRect(x: screenWidth*0.03, y: screenHeight*0.995-(keyboardHeight ?? 0.0)-screenHeight*0.04, width: screenWidth*0.80, height: screenHeight*0.04)
        btnSend.frame = CGRect(x: screenWidth*0.87, y: screenHeight*0.995-(keyboardHeight ?? 0.0)-screenWidth*0.08, width: screenWidth*0.10, height: screenWidth*0.08)
        tableView.frame = CGRect(x: 0, y: screenHeight-(keyboardHeight ?? 0.0)-screenHeight*0.52, width: screenWidth, height: screenHeight*0.45)

    }

    public override func draw(_ rect: CGRect) {
        

        
        addSubview(messView)
        addSubview(txtMesage)
        txtMesage.delegate = self
        addSubview(btnSend)
        addSubview(tableView)
 

        updateFrame()
        
        txtMesage.font = TextFieldFont
        txtMesage.backgroundColor = TextFieldBackgroundColor
        messView.backgroundColor = messageViewBackgroundColor
        tableView.backgroundColor = tableViewBackgroundColor
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChatTableCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .none
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = false
    }


}

extension ChatView: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages[section].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ChatTableCell else { fatalError("Unable to deque cell") }
        let jitsiMessage = messages[indexPath.section][indexPath.row]
        cell.messageSet = jitsiMessage
        cell.backgroundColor = .clear
        return cell
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let firstMessageInSection = messages[section].first {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
            let dateString = dateFormatter.string(from: firstMessageInSection.time)
            
            let label = DateHeaderLabel()
            label.text = dateString
            let timeString = label.text
            let time = timeString?.dropFirst(11)
            label.text = "\(time!)"
            
            let containerView = UIView()
            containerView.addSubview(label)
            
            if(firstMessageInSection.isInComing){
                leadingConstraint = label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
                leadingConstraint.isActive = true
                
                trailingConstraint = label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
                trailingConstraint.isActive = false
           }else{
               leadingConstraint = label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
               leadingConstraint.isActive = false
                
               trailingConstraint = label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
               trailingConstraint.isActive = true
            }
            
         return containerView
        }
       return nil
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }
    
    public func dateToString() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let date = Date()
        let msgDate = dateFormatter.string(from: date)
        return msgDate
    }
    
    public func dateHandler() -> Date {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let date = Date()
        return date
    }
}

public extension Selector {
    static let keyboardWillShow = #selector(ChatView.keyboardWillShow(notification:))
}
