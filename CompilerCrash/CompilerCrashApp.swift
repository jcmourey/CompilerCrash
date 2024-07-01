import SwiftUI
import ComposableArchitecture

@Reducer
struct CompilerCrash {
    @Reducer(state: .equatable)
    public enum Destination {
        case signIn(SignIn)
    }
    @ObservableState
    struct State: Equatable {
        @Presents var destination: Destination.State?
    }
}

actor SignInService {}

@Reducer
struct SignIn {
    @ObservableState
    struct State: Equatable {   // removing Equatable makes the compiler crash
        let userName: String
        
        @ObservationStateIgnored
        let signInService: SignInService
        
// Workaround:
//        static func == (lhs: Self, rhs: Self) -> Bool {
//            lhs.userName == rhs.userName
//        }
    }
}

@main
struct CompilerCrashApp: App {
    var body: some Scene {
        WindowGroup {}
    }
}
