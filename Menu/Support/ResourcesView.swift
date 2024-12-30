import SwiftUI

struct ResourcesView: View {
    let resources: [Resource] = [
        Resource(title: "Emergency",
                 image: "close-button",
                 callCenter: "911",
                 textLine: nil,
                 helpLine: "Contact local law enforcement, fire department, or medical services.",
                 website: "https://www.fema.gov"),
        Resource(title: "School Bullying",
                 image: "close-button",
                 callCenter: "952-838-9000",
                 textLine: nil,
                 helpLine: "PACER Center for addressing bullying in schools.",
                 website: "https://www.stopbullying.gov"),
        Resource(title: "Depressed",
                 image: "close-button",
                 callCenter: "988",
                 textLine: "Text HOME to 741741",
                 helpLine: "Crisis Text Line and Suicide Prevention Lifeline.",
                 website: "https://www.samhsa.gov"),
        Resource(title: "Cyberbullying",
                 image: "close-button",
                 callCenter: "1-800-843-5678",
                 textLine: nil,
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
                    
                    Image("resources-menu-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.25)
                    
                    VStack(spacing: 24) {
                        ForEach(resources, id: \.title) { resource in
                            ResourcesComponentView(resourcesTitle: resource.title,
                                                   resourcesImage: resource.image,
                                                   callCenter: resource.callCenter,
                                                   textLine: resource.textLine,
                                                   helpLine: resource.helpLine,
                                                   website: resource.website)
                        }
                    }
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack {
                        NavigationLink {
                            SupportView()
                        } label: {
                            MenuBackNavigationView(color: Colors.customGreen)
                        }
                    }
                }
                .padding(.horizontal, 48)
                .scrollIndicators(.never)
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
    }
}
