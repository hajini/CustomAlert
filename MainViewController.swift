//
//  MainViewController.swift
//
//  Created by Hajin Jeong on 2021/06/03.
//

import UIKit

class MainViewController: UIViewController {

    var customAlertView = CustomAlertView()
    // 사용할 때, 반드시 CustomAlertView()를 var 로 불러와 놓고 사용해야 함
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        customAlertView.customAlert01(mainView: self.view, title: "타이틀", message: "여기는 내용입니다", heightOfTotalAlertView: 132, HeightSumOfAllButtons: 44, leftBtnTitle: "나가기", RightBtnTitle: "계속 작성") {
            print("leftBtn TAP!!!!")
        } rightBtnCompletion: {
            print("rightBtn TAP!!!!")
        }
        
        
        // 아래와 같이 CustomAlertView()로 직접 불러와서 사용할 경우, 버튼을 눌렀을 때, 뷰가 사라지지 않는 문제 발생함
        
//        CustomAlertView().customAlert01(mainView: self.view, title: "타이틀", message: "여기는 내용입니다", heightOfTotalAlertView: 132, HeightSumOfAllButtons: 44, leftBtnTitle: "나가기", RightBtnTitle: "계속 작성") {
//            print("leftBtn TAP!!!!")
//        } rightBtnCompletion: {
//            print("rightBtn TAP!!!!")
//        }
        
        
        
    }
    


}
