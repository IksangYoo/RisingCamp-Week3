//
//  StoreListViewController.swift
//  Week3
//
//  Created by Iksang Yoo on 2023/02/06.
//

import UIKit
import Tabman
import Pageboy

class StoreListViewController: TabmanViewController {
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var sortView: CustomView!
    private var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendVC()
        self.dataSource = self
        tabBarLayout()
        categoryView.layer.addBorder([.bottom], color: .gray, width: 0.3)
        sortView.makeRightSideRoundCorners()
    }
}

extension StoreListViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return 15
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "족발・보쌈")
        case 1:
            return TMBarItem(title: "찜・탕・찌개")
        case 2:
            return TMBarItem(title: "돈까스・회・일식")
        case 3:
            return TMBarItem(title: "피자")
        case 4:
            return TMBarItem(title: "고기・구이")
        case 5:
            return TMBarItem(title: "야식")
        case 6:
            return TMBarItem(title: "양식")
        case 7:
            return TMBarItem(title: "치킨")
        case 8:
            return TMBarItem(title: "중식")
        case 9:
            return TMBarItem(title: "아시안")
        case 10:
            return TMBarItem(title: "백반・죽・국수")
        case 11:
            return TMBarItem(title: "도시락")
        case 12:
            return TMBarItem(title: "분식")
        case 13:
            return TMBarItem(title: "카페・디저트")
        case 14:
            return TMBarItem(title: "패스트푸드")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    
    func tabBarLayout() {
        let bar = TMBar.ButtonBar()
        
        //탭바 레이아웃 설정
        bar.layout.transitionStyle = .snap
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .intrinsic
        bar.layout.interButtonSpacing = 35 // 버튼 사이 간격 (화면 보면서 필요시 조절)
        
        
        //배경색
        bar.backgroundView.style = .clear
        bar.backgroundColor = .white
        
        //간격설정
        bar.layout.contentInset = UIEdgeInsets(top: 10, left: 35, bottom: 0, right: 25)
        
        //버튼 글시 커스텀
        bar.buttons.customize{
            (button) in
            button.tintColor = .gray
            button.selectedFont = UIFont.systemFont(ofSize: 17, weight: .bold)
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 17)
        }
        
        //indicator
        bar.indicator.weight = .custom(value: 4)
        bar.indicator.overscrollBehavior = .none
        bar.indicator.tintColor = .black
        bar.indicator.transitionStyle = .none
        bar.indicator.frame.width
        
        
        addBar(bar, dataSource: self, at: .custom(view: categoryView, layout: nil))
    }
 
    func appendVC() {
        let jokbalVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "JokbalVC") as! JokbalViewController
        let soupVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SoupVC") as! SoupViewController
        
        viewControllers.append(jokbalVC)
        viewControllers.append(soupVC)
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
        viewControllers.append(UIViewController())
    }
}
