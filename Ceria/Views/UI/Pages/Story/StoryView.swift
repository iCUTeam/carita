//
//  StoryView.swift
//  Ceria
//
//  Created by Kevin Gosalim on 17/10/22.
//

import UIKit

final class StoryView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var content: String
    
    init(content: String) {
        self.content = content
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupAutoLayout()
        
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    lazy var dialogueLabel: UILabel = {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let constant: CGFloat
        let size: CGFloat
        
        switch screenWidth {
        case 744: //7.9 inch
            constant = 10.0
            size = 18.5
        case 768: //8.3 inch
            constant = 10.0
            size = 19
        case 810: //10.2 inch
            constant = 12.0
            size = 20
        case 820: //10.9 inch
            constant = 12.0
            size = 20
        case 834: //10.5 & 11 inch
            constant = 12.0
            size = 21
        default: //12.9 inch
            constant = 15.0
            size = 23
        }
        
        let label = UILabel()
        label.text = content
        label.setLineHeight(lineHeight: constant)
        label.font = UIFont.scriptFont(size: size)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dialogueTextFrame: UIView = {
            
        let frame = UIView(frame: CGRect(x:0, y:0, width: (UIScreen.main.bounds.width)-54, height: 100))
        frame.backgroundColor = UIColor(red: 242.0/255, green: 205.0/255, blue: 93.0/255, alpha: 1.0)
        frame.roundCornerView(corners: .allCorners, radius: 25)
        addSubview(frame)
        frame.addSubview(dialogueLabel)
        return frame
    }()
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            dialogueTextFrame.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            dialogueLabel.topAnchor.constraint(equalTo: dialogueTextFrame.topAnchor, constant: 20),
            dialogueLabel.leftAnchor.constraint(equalTo: dialogueTextFrame.leftAnchor, constant: 20),
            dialogueLabel.rightAnchor.constraint(equalTo: dialogueTextFrame.rightAnchor, constant: -20),
        ])
    }
}
