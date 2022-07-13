import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let services = Decoder().decode()
        NavigationView {
            VStack {
                List {
                    ForEach(services, id: \.name) { service in
                        HStack {
                            AsyncImage(url: URL(string: service.icon_url)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                Color.brown
                            }.frame(width: 55.0, height: 55.0)
                            
                            VStack {
                                Text(service.name)
                                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                                Text(service.description)
                                    .font(.system(size: 14))
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .onTapGesture {
                            UIApplication.shared.open(URL(string: service.link)!)
                        }
                    }
                }
            }
            .navigationTitle("Сервисы VK")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
