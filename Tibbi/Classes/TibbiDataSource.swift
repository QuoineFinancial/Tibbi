//
//  TibbiDataSource.swift
//  Viper
//
//  Created by Cristian Azov on 8/16/17.
//  Copyright © 2017 Cristian Azov. All rights reserved.
//

import UIKit

open class TibbiDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    open var sections: [Section] = []

    open func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }

    // MARK: Cell

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let viewModel = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.identifier, for: indexPath)

        if let configCell = cell as? CellConfigurable {
            configCell.configure(with: viewModel)
        }

        return cell
    }

    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let viewModel = sections[indexPath.section].rows[indexPath.row] as? CellStaticHeightAdopting {
            return viewModel.height
        }
        return UITableViewAutomaticDimension
    }

    // MARK: Delegate

    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let viewModel: Any = sections[indexPath.section].rows[indexPath.row]

        if let deselectableRow = viewModel as? CellDeselectable,
            deselectableRow.deselection.shouldDeselect == true {
            tableView.deselectRow(at: indexPath, animated: deselectableRow.deselection.animated)
        }
        self.tableViewDidSelectRow(with: viewModel, at: indexPath)
    }

    open func tableViewDidSelectRow(with viewModel: Any, at indexPath: IndexPath) {
        if let rowViewModel = viewModel as? CellSelectable {
            rowViewModel.action(indexPath)
        }
    }

    // MARK: Header

    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sections[section].header.view
    }

    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].header.title
    }

    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let header = sections[section].header
        if let view = header.view {
            return view.bounds.size.height
        }
        return header.height
    }

    // MARK: Footer

    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sections[section].footer.view
    }

    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footer.title
    }

    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let footer = sections[section].footer
        if let view = footer.view {
            return view.bounds.size.height
        }
        return footer.height
    }

    // MARK: Section Index

    open func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.flatMap {
            if let title = $0.header.title {
				return String(title[..<title.startIndex])
            }
            return nil
        }
    }

}
