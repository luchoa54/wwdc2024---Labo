import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State private var currentTextIndex = 0
    @State private var currentTextCount = 0
    
    var body: some View {
        VStack {
            
            SpriteView(scene: GameController.shared.initialScene)
                .frame(width: 900, height: 800)
                .statusBar(hidden: true)
                .ignoresSafeArea()
            
            TextBoxComponent(textArray: TextDataManager.worldDoomedDialog)

        }
    }
    
    func getCurrentText() -> String {
        let currentText = TextDataManager.worldDoomedDialog[self.currentTextIndex].text
        let endIndex = currentText.index(currentText.startIndex, offsetBy: self.currentTextCount)
        return String(currentText[..<endIndex])
    }
    
    func TextWriteOnScreen() {
        let totalTime = 4.0
        let charCount = Double(TextDataManager.worldDoomedDialog[self.currentTextIndex].text.count)
        let interval = totalTime / charCount
        let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            if self.currentTextCount < TextDataManager.worldDoomedDialog[self.currentTextIndex].text.count {
                self.currentTextCount += 1
            }
        }
        timer.fire()
    }
}
