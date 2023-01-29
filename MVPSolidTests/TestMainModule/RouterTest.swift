//
//  RouterTest.swift
//  MVPSolidTests
//
//  Created by Владислав Белый on 26.01.2023.
//

import XCTest
@testable import MVPSolid

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    var rootVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        return super.pushViewController(viewController, animated: animated)
    }
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        self.rootVC = viewController
        return super.popToViewController(viewController, animated: animated)
    }
}

final class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assembly = AssemblyModelBuilder()

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }
    
    func testRouter() {
        router.showDetail(comment: nil)
        let detailViewController = navigationController.presentedVC
        
        XCTAssertTrue(detailViewController is DetailViewController)
    }

    func testPopToRoot() {
        router.showDetail(comment: nil)
        var presentedViewController = navigationController.presentedVC
        router.popToRoot()
        presentedViewController = navigationController.rootVC

        XCTAssertTrue(presentedViewController is MainViewController)
    }
    
}
