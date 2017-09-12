//
//  TibbiEntity.swift
//  Viper
//
//  Created by Cristian Azov on 8/16/17.
//  Copyright © 2017 Cristian Azov. All rights reserved.
//

import UIKit

public protocol CellDetectable {
    var identifier: String { get set }
}

public protocol CellStaticHeightAdopting {
    var height: CGFloat { get set }
}

public protocol CellConfigurable {
    func configure(with viewModel: Any)
}

public typealias CellAction = ((IndexPath) -> Void)

public protocol CellSelectable {
    var action: CellAction { get set }
}

public struct CellDeselectionModel {
    var shouldDeselect = true
    var animated = true
    
    public init() { }
}

public protocol CellDeselectable {
    var deselectionModel: CellDeselectionModel { get set }
}

public struct SectionView {
    public var height: CGFloat = 0.01
    public var view: UIView?
    public var title: String? {
        didSet {
            height = 30
        }
    }
}

public struct SectionIndexModel {
    var shouldShowIndexes = true
    var indexes: [String]
    
    public init(indexes: [String]) {
        self.indexes = indexes.flatMap { title -> String? in
            return title.characters.count == 0 ? nil :
                title.substring(to: title.index(title.startIndex, offsetBy: 1))
        }
    }
}

public protocol SectionIndexable {
    var indexModel: SectionIndexModel { get set }
}

public struct Section {
    public var rows: [CellDetectable]
    public var header: SectionView
    public var footer: SectionView
    public var indexTitle: String?
    
    public init() {
        self.rows = []
        self.header = SectionView()
        self.footer = SectionView()
    }
}

public struct Table {
    var sections: [Section]
    var sectionIndexTitles: [String]?
}
