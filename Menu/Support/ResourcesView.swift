import SwiftUI

struct ResourcesView: View {
    let resources: [Resource] = [
        Resource(title: "Emergency",
                 image: "emergency-resources-logo",
                 callCenter: "911",
                 helpLine: "Contact local law enforcement, fire department, or medical services.",
                 website: "https://www.fema.gov"),
        Resource(title: "School Bullying",
                 image: "schoolbullying-resources-logo",
                 callCenter: "952-838-9000",
                 helpLine: "PACER Center for addressing bullying in schools.",
                 website: "https://www.stopbullying.gov"),
        Resource(title: "Depressed",
                 image: "depression-resources-logo",
                 callCenter: "988",
                 helpLine: "Crisis Text Line and Suicide Prevention Lifeline.",
                 website: "https://www.samhsa.gov"),
        Resource(title: "Cyberbullying",
                 image: "cyberbullying-resources-logo",
                 callCenter: "1-800-843-5678",
                 helpLine: "CyberTipline at the National Center for Missing and Exploited Children.",
                 website: "https://www.cyberbullying.org")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("support-background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.6)
                
                ScrollView {
                    Spacer()
                    
                    Image("resources-menu-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.25)
                    
                    VStack(spacing: 24) {
                        ForEach(resources, id: \.title) { resource in
                            ResourcesComponentView(resource: resource)
                        }
                    }
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack {
                        SupportBackNavigationView(color: Colors.customGreen)
                    }
                }
                .padding(.horizontal, 72)
                .scrollIndicators(.never)
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
    }
}
