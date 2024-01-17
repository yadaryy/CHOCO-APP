//
//  Presenter.swift
//  ChatRoom
//
//  Created by Yadar Tulayathamrong on 11/1/2567 BE.
//

import Foundation

protocol Presentation {
    typealias Input = ()
    typealias Output = ()
    typealias Producer = (Presentation.Input) -> Presentation
    
    var input:Input {get}
    var output: Output {get}
}

class Presenter : Presentation {
    typealias UseCases = (
        input: (),
        output: ()
    )
    typealias Dependencies = (
        router: Routing,
        usecases: UseCases
    )
    var input: Input
    var output: Output
    
    private let dependencies : Dependencies
    private let useCases:UseCases
    private let router:Routing
    
    init(input: Input, dependencies:Dependencies) {
        self.dependencies = dependencies
        self.router = dependencies.router
        self.useCases = dependencies.usecases
        self.input = input
        self.output = Presenter.output(input: self.input)
        self.process()
    }
}

private extension Presenter {
    static func output(input:Input) -> Output {
        return ()
    }
    func process() {
        
    }
}
