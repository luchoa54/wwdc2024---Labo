import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        VStack {
            SpriteView(scene: GameController.shared.initialScene)
                .statusBar(hidden: true)
                .ignoresSafeArea()
        }
    }
}
