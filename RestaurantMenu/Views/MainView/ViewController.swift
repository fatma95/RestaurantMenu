//
//  ViewController.swift
//  RestaurantMenu
//
//  Created by Fatma Mohamed on 6/6/18.
//  Copyright © 2018 Fatma Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK:- Outlets
    @IBOutlet var mainTableView: UITableView!
    
    //MARK:- Variables and Constants
    var menuObject: BaseObject!
    var selectedRowIndex: IndexPath?
    let searchController = UISearchController(searchResultsController: nil)
    var filteredItems = [Items]()
    var headerCell = MenuCategoryHeader()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.rowHeight = UITableViewAutomaticDimension
        let nib = UINib(nibName: "MenuCategoryHeader", bundle: nil)
        //register MenuHeadingView in tableView
        mainTableView.register(nib, forHeaderFooterViewReuseIdentifier: "MenuCategoryHeader")
       
        getData()
    }
    
    //MARK:- Retrieve list of Menu Items from API
    func getData()
    {
        
        ShowAlert.showLoader(alertMessage: "Please wait ...", parent: self)
        MenuModel.getData { (Data, error) in
            if error == nil
            {
                self.menuObject = Data as! BaseObject
                self.dismiss(animated: true, completion: nil)
                for i in 0...(self.menuObject.categories!.count - 1)
                {
                    self.menuObject.categories![i].isExpanded = true
                }
                
                
                self.mainTableView.reloadData()
            }
                
            else
            {
                self.dismiss(animated: true, completion: nil)
                ShowAlert.showAlertInView(alertMessage: (error?.localizedDescription)! ,parent:self)
            }

            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


    //MARK:- TableDataSource and TableDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if menuObject != nil
        {
            if !menuObject.categories![section].isExpanded!
            {
                return 0
            }
            else
            {
                return (self.menuObject.categories![section].items?.count)!
                
            }
        }
        else
        {
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if menuObject != nil
        {
            return (self.menuObject.categories?.count)!

        }
            
        else
        {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = Bundle.main.loadNibNamed("MenuItemTableViewCell", owner: self, options: nil)?.first as! MenuItemTableViewCell
        let item: Items
         if menuObject != nil
         {
            item = (menuObject.categories?[indexPath.section].items![indexPath.row])!
            cell.itemTitle?.text = item.name
            cell.itemDescription?.text = item.description
        }
    
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuCategoryHeader") as! MenuCategoryHeader
        if (menuObject.categories?[section].isExpanded)!
        {
            headerCell.dropDownImage.image = #imageLiteral(resourceName: "up_icon")
            
        }
            
        else
        {
            headerCell.dropDownImage.image = #imageLiteral(resourceName: "dropdown_icon")
            
        }
        
        let button = headerCell.headerButton
        headerCell.headerLabel.text = menuObject.categories?[section].name
        button?.addTarget(self, action: #selector(doCollapseExpandSection), for: .touchUpInside)
        button?.tag = section
        headerCell.dropDownImage.tag = section
        return headerCell
        
    }
    
    @objc func doCollapseExpandSection(button: UIButton)
    {
        
        let section = button.tag
        let cell = self.mainTableView.headerView(forSection: section) as? MenuCategoryHeader
        //cell?.dropDownImage.image = #imageLiteral(resourceName: "up_icon")
        var indexPaths = [IndexPath]()
        for row in (menuObject.categories![section].items?.indices)!
        {
            let indexPath:IndexPath!
            indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
    
        let isExpanded =  menuObject.categories![section].isExpanded
        menuObject.categories![section].isExpanded = !isExpanded!
        if isExpanded! {
            cell?.dropDownImage.image = #imageLiteral(resourceName: "dropdown_icon")
            mainTableView.beginUpdates()
            mainTableView.deleteRows(at: indexPaths, with: .top)
            mainTableView.endUpdates()
        }
        
        else
        {
            let indexPath = IndexPath(row: 0, section: section)
            cell?.dropDownImage.image = #imageLiteral(resourceName: "up_icon")
            mainTableView.beginUpdates()
            mainTableView.insertRows(at: indexPaths, with: .bottom)
            mainTableView.endUpdates()
            mainTableView.scrollToRow(at:indexPath , at: .top, animated: true)

        }

    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
}

