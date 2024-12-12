import SwiftUI

@main
struct MyApp: App {
    @StateObject private var viewModel = ChallengeViewModel()
    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .environmentObject(viewModel)
        }
    }
}
