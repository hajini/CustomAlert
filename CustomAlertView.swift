//
//  CustomAlertView.swift
//
//
//  Created by Hajin Jeong on 2021/06/03.
//

import UIKit

class CustomAlertView {
    
    var backgroundView = UIView()
    var baseView = UIView()
    var centerView = UIView()
    var leftBtnView = UIView()
    var rightBtnView = UIView()
    var titleLabel = UILabel()
    var messageLabel = UILabel()
    var leftBtn = UIButton()
    var rightBtn = UIButton()
    
    func customAlert01(mainView: UIView, title: String, message: String, heightOfTotalAlertView: CGFloat, HeightSumOfAllButtons: CGFloat, leftBtnTitle: String, RightBtnTitle: String, leftBtnCompletion: @escaping () -> (Void), rightBtnCompletion: @escaping () -> (Void)) {
        
        // 시작전에 초기화. 초기화 하지 않으면, 사용할때마다 아래 코드들이 누적되어서....
        backgroundView = UIView()
        baseView = UIView()
        centerView = UIView()
        leftBtnView = UIView()
        rightBtnView = UIView()
        titleLabel = UILabel()
        messageLabel = UILabel()
        leftBtn = UIButton()
        rightBtn = UIButton()
        
        createBasicViews(mainView: mainView, heightOfTotalAlertView: heightOfTotalAlertView, HeightSumOfAllButtons: HeightSumOfAllButtons)
        createBasic2Buttons(leftBtnTitle: leftBtnTitle, rightBtnTitle: RightBtnTitle, leftBtnCompletion: leftBtnCompletion, rightBtnCompletion: rightBtnCompletion)
        
        if message == "" {
            titleLabel.frame = CGRect(x: 20, y: 20, width: centerView.frame.width-40, height: 48)
            titleLabel.numberOfLines = 0
            titleLabel.text = title
            titleLabel.font = UIFont(name: "", size: 15)
            titleLabel.textAlignment = .center
            titleLabel.alpha = 0
        } else {
            titleLabel.frame = CGRect(x: 20, y: 20, width: centerView.frame.width-40, height: 24)
            titleLabel.numberOfLines = 0
            titleLabel.text = title
            titleLabel.textAlignment = .center
            titleLabel.alpha = 0
            
            messageLabel.frame = CGRect(x: 20, y: 52, width: centerView.frame.width-40, height: 40)
            messageLabel.numberOfLines = 0
            messageLabel.text = message
            messageLabel.font = UIFont(name: "", size: 15)
            messageLabel.textAlignment = .center
            messageLabel.alpha = 0
            
        }
        
        centerView.addSubview(titleLabel)
        centerView.addSubview(messageLabel)
        mainView.addSubview(backgroundView)
        mainView.addSubview(baseView)
        mainView.addSubview(centerView)
        mainView.addSubview(leftBtnView)
        mainView.addSubview(rightBtnView)
        mainView.addSubview(leftBtn)
        mainView.addSubview(rightBtn)

        UIView.animate(withDuration: 0.2) {
            self.backgroundView.alpha = 0.5
            self.baseView.alpha = 0.7
            self.centerView.alpha = 0.95
            self.titleLabel.alpha = 1
            self.messageLabel.alpha = 1
            self.leftBtnView.alpha = 0.95
            self.rightBtnView.alpha = 0.95
            self.leftBtn.alpha = 1
            self.rightBtn.alpha = 1
        }
    }
    
    
    
    func createBasicViews(mainView: UIView, heightOfTotalAlertView: CGFloat, HeightSumOfAllButtons: CGFloat) {
        backgroundView.frame = CGRect(x: 0, y: 0, width: mainView.frame.width, height: mainView.frame.height)
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        
        baseView.frame = CGRect(x: 53, y: (mainView.frame.height/2)-(heightOfTotalAlertView/2)+1, width: mainView.frame.width-106, height: heightOfTotalAlertView)
        baseView.layer.cornerRadius = 15
        baseView.backgroundColor = .white
        baseView.alpha = 0
        
        centerView.frame = CGRect(x: baseView.frame.minX, y: baseView.frame.minY, width: baseView.frame.width, height: baseView.frame.height-HeightSumOfAllButtons+1)
        centerView.layer.cornerRadius = 15
        centerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        centerView.backgroundColor = .white
        centerView.alpha = 0
    }
    
    func createBasic2Buttons(leftBtnTitle: String, rightBtnTitle: String, leftBtnCompletion: @escaping () -> (Void), rightBtnCompletion: @escaping () -> (Void)) {
        leftBtnView.frame = CGRect(x: baseView.frame.minX, y: centerView.frame.maxY+1, width: centerView.frame.width/2, height: 44)
        leftBtnView.backgroundColor = .white
        leftBtnView.alpha = 0
        leftBtnView.layer.cornerRadius = 15
        leftBtnView.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        leftBtn.frame = leftBtnView.frame
        leftBtn.layer.cornerRadius = 15
        leftBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
        leftBtn.backgroundColor = .clear
        leftBtn.setAttributedTitle(NSAttributedString(string: leftBtnTitle), for: .normal)
        leftBtn.setTitle(leftBtnTitle, for: .normal)
        leftBtn.addTarget(self, action: #selector(exit(sender:)), for: .touchUpInside)
        
        leftBtn.addAction {
            leftBtnCompletion()
        }
        leftBtn.alpha = 0
        
        rightBtnView.frame = CGRect(x: baseView.frame.minX+(centerView.frame.width/2)+1, y: centerView.frame.maxY+1, width: (centerView.frame.width/2)-1, height: 44)
        rightBtnView.backgroundColor = .white
        rightBtnView.alpha = 0
        rightBtnView.layer.cornerRadius = 15
        rightBtnView.layer.maskedCorners = [.layerMaxXMaxYCorner]
       
        rightBtn.frame = rightBtnView.frame
        rightBtn.layer.cornerRadius = 15
        rightBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]
        rightBtn.backgroundColor = .clear
        rightBtn.setAttributedTitle(NSAttributedString(string: rightBtnTitle), for: .normal)
        rightBtn.setTitle(rightBtnTitle, for: .normal)
        rightBtn.addTarget(self, action: #selector(exit(sender:)), for: .touchUpInside)
        rightBtn.titleLabel?.font = UIFont(name: "", size: 15)
        
        rightBtn.addAction {
            rightBtnCompletion()
        }
        rightBtn.alpha = 0
    }
    
    @objc func exit(sender: UIButton) {
        print("작동!")
        UIView.animate(withDuration: 0.2) {
            self.backgroundView.alpha = 0
            self.baseView.alpha = 0
            self.centerView.alpha = 0
            self.titleLabel.alpha = 0
            self.messageLabel.alpha = 0
            self.leftBtnView.alpha = 0
            self.rightBtnView.alpha = 0
            self.leftBtn.alpha = 0
            self.rightBtn.alpha = 0
        } completion: { _ in
            self.backgroundView.removeFromSuperview()
            self.baseView.removeFromSuperview()
            self.centerView.removeFromSuperview()
            self.leftBtnView.removeFromSuperview()
            self.rightBtnView.removeFromSuperview()
            self.leftBtn.removeFromSuperview()
            self.rightBtn.removeFromSuperview()
        }
    }

    
}

extension UIButton {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        @objc class ClosureSleeve: NSObject {
            let closure:()->()
            init(_ closure: @escaping()->()) { self.closure = closure }
            @objc func invoke() { closure() }
        }
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "\(UUID())", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
