import SwiftUI

struct QuizView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Quiz View")
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
    }
}

