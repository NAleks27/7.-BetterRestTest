//
//  Test.swift
//  BetterRest
//
//  Created by Aleksey Nosik on 05.10.2022.
//

import SwiftUI

struct Test: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        
            DatePicker("Please enter date", selection: $wakeUp, displayedComponents: .date)
                .labelsHidden()
                .padding(.top, 20)
            
            DatePicker("Please enter date", selection: $wakeUp, in: Date.now...)
                .padding(.top, 20)
            
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
            Text(Date.now.formatted(date: .long, time: .omitted))

        }
    }
    
    func exampleDate() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
    
    func trivialExample() {
        let now = Date.now
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = now...tomorrow
    }
    
    func trivialExample2() {
        var components = DateComponents()
        components.hour = 9
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
        
        // данные из DateComponents приходят нам опциональные
        let components2 = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components2.hour ?? 0
        let minute = components2.minute ?? 0
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
