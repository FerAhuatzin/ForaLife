//
//  DBHelper.swift
//  ForaLife
//
//  Created by Jesus Fernando Armendariz Zarate on 23/06/23.
//

/*
import Foundation
import SQLite3



class MySQLManager
{
    
    static func getDBPointer(databaseName: String) -> OpaquePointer?
    {
        
        var databasePointer: OpaquePointer?
        let documentDatabasePath = FileManager.default.urls(for: .documentDirectory, in: userDomainMask)[0].appendingPathComponent(databaseName).path
        
        
        if FileManager.default.fileExists(atPath: documentDatabasePath)
        {
            print("Database already exists")
        }//end if
        else
        {
            guard let bundleDatabasePath = Bundle.main.resourceURL?.appendingPathComponent(databaseName).path
            else
            {
                print("Unwrapping Error: Bundel Database Path doesn´t exist")
                return nil
            }//end else
            do
            {
                try FileManager.default.copyItem(at: bundleDatabasePath, to: documentDatabasePath)
                print("Database created")
            }//end do
            catch
            {
                
                print("Error: \(error.localizedDescription)")
                return nil
            }//end catch
            
        }//end else
            
        if sqlite3_open(documentDatabasePath, &databasePointer) == SQLITE_OK
        {
        
            print("Succesfully open database")
            
            print("Database path: \(documentDatabasePath)")
            
        }//end if
        else
        {
         
            print("Could not open database")
            
        }//end else
            
        return databasePointer
        
    }//end getDBPointer
    
}//end class
*/
