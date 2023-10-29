//
//  Team4_MAPD714_ProjectMilestone2UITestsLaunchTests.swift
//  Team4_MAPD714_ProjectMilestone2UITests
//
//  Created by Rahul Edirisinghe on 2023-10-29.
//

import XCTest

final class Team4_MAPD714_ProjectMilestone2UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
