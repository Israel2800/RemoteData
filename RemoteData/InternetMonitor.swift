//
//  InternetMonitor.swift
//  RemoteData
//
//  Created by Paola Delgadillo on 10/12/24.
//

import Foundation
import Network

class InternetMonitor {
    // Decidir si me sirve que sea un singleton
    var hayConexion = false
    var tipoConexionWiFi = false
    
    private var monitor = NWPathMonitor()
    
    init() {
        // Que debe de hacer cuando cambie el estado de la conexión...
        monitor.pathUpdateHandler = { ruta in
            self.hayConexion = ruta.status == .satisfied
            self.tipoConexionWiFi = ruta.usesInterfaceType(.wifi)
        }
        
        // Para que comience a revisar si hay cambios...
        // Los procesos que pueden tomar mucho tiempo o muchos recursos se DEBEN mandar a background
        monitor.start(queue: DispatchQueue.global(qos: .background))
    }
}
