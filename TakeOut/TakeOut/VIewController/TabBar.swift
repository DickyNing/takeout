import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            categoriesView()
                .tabItem {
                    Label("Categories", systemImage: "folder.circle.fill")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            menuView()
                .tabItem {
                    Label("Food", systemImage: "fork.knife")
                }
            settingView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        
    }
    
}
struct tabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
