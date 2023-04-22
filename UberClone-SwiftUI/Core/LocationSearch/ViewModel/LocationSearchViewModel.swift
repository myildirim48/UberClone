//
//  LocationSearchViewModel.swift
//  UberClone-SwiftUI
//
//  Created by YILDIRIM on 22.04.2023.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject,ObservableObject {
    
    //MARK: -  Properties
    @Published var results = [MKLocalSearchCompletion()]
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet{
            print("DEBUG: Qery Fragment : \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
}

//MARK: - MKLocalSearchCompleterDelegate
 

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
