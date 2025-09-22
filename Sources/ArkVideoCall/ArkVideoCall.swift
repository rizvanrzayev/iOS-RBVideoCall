import JitsiMeetSDK

public struct ArkVideoCall {
    private lazy var jitsiView = JitsiMeetView()
    
    private lazy var chatView: ChatView = {
        let view = ChatView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public private(set) var text = "Hello, World!"

    public init() {
        
    }
}
