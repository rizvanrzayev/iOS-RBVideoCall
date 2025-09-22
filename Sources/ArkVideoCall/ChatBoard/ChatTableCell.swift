//
//  ChatTableCell.swift
//  ArkVideoCallDemo
//
//  Created by ArkSigner ArkSigner on 23.12.2022.
//  Copyright © 2022 ArkSigner ArkSigner. All rights reserved.
//

import UIKit
import Foundation

public class ChatTableCell: UITableViewCell {
    
    public var leadingConstraint: NSLayoutConstraint!
    public var trailingConstraint: NSLayoutConstraint!
    public var messageLabel = UILabel()
    public let bubbleBackGroundView = UIView()

    public var messageSet: Message! {
        
        didSet {
            
            bubbleBackGroundView.backgroundColor = messageSet.isInComing ? isInComingBubbleGroundColor: isOutGoingBubleGroundColor
            messageLabel.textColor = messageSet.isInComing ? isInComingTextColor: isOutGoingTextColor
        
            if messageSet.isInComing {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        
            messageLabel.text = "\(messageSet.text)"
            messageLabel.font = messageLabelFont        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            bubbleBackGroundView.layer.cornerRadius = 20
            bubbleBackGroundView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(bubbleBackGroundView)
            addSubview(messageLabel)
          
            messageLabel.numberOfLines = 0
            messageLabel.translatesAutoresizingMaskIntoConstraints = false

                let constraints = [
                    messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                    messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
                    messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),

                    bubbleBackGroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8),
                    bubbleBackGroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
                    bubbleBackGroundView.bottomAnchor .constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
                    bubbleBackGroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
                ]

            NSLayoutConstraint.activate(constraints)
            
            leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
            leadingConstraint.isActive = true

            trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
            trailingConstraint.isActive = false
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
}

public class DateHeaderLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = dateLabelBackgroundcolor
        textColor = dateLabelTextColor
        font = dateLabelFont
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var intrinsicContentSize:CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height+12
        layer.cornerRadius = height/2
        layer.masksToBounds = true
        return CGSize(width: originalContentSize.width+20, height: height)
    }
}
