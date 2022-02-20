//
//  MovieDataSource.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 20/02/22.
//

import Foundation
import CoreData
import UIKit

//MARK: CRUD DATA
extension BaseViewController {
    
    func createMovieData(_ id:Int, _ imageUrl:String, _ rating:Int, _ title:String, _ year:Int, _ like:Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)
        let insert = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        
        insert.setValue(id, forKey: "id")
        insert.setValue(imageUrl, forKey: "imageUrl")
        insert.setValue(rating, forKey: "rating")
        insert.setValue(title, forKey: "title")
        insert.setValue(year, forKey: "year")
        insert.setValue(like, forKey: "like")
        
        do{
            try managedContext.save()
        }catch let err{
            print(err)
        }
    }
    
    func retrieveMovieData() -> [MovieEntity]{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        var movies = [MovieEntity]()
        
        do{
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            result.forEach{ data in
                movies.append(
                    MovieEntity(
                        id: data.value(forKey: "id") as! Int,
                        imageUrl: data.value(forKey: "imageUrl") as! String,
                        rating: data.value(forKey: "rating") as! Int,
                        title: data.value(forKey: "title") as! String,
                        year: data.value(forKey: "year") as! Int,
                        like: data.value(forKey: "like") as! Bool
                    )
                )
            }
        }catch let err{
            print(err)
        }
        
        return movies
    }
    
    func updateMovieData(_ id:Int, _ imageUrl:String, _ rating:Int, _ title:String, _ year:Int, _ like: Bool){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Movie")
        fetchRequest.predicate = NSPredicate(format: "id = \(id)")
        
        do{
            let fetch = try managedContext.fetch(fetchRequest)
            let dataToUpdate = fetch[0] as! NSManagedObject
            dataToUpdate.setValue(id, forKey: "id")
            dataToUpdate.setValue(imageUrl, forKey: "imageUrl")
            dataToUpdate.setValue(rating, forKey: "rating")
            dataToUpdate.setValue(title, forKey: "title")
            dataToUpdate.setValue(year, forKey: "year")
            dataToUpdate.setValue(like, forKey: "like")
            try managedContext.save()
        }catch let err{
            print(err)
        }
    }
    
    func deleteAllMovieData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Movie")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try managedContext.execute(deleteRequest)
        } catch let err as NSError {
            print(err)
        }
    }
    
    func deleteMovieDataByID(_ id:Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Movie")
        fetchRequest.predicate = NSPredicate(format: "id = \(id)")
        fetchRequest.fetchLimit = 1
 
        do{
            let dataToDelete = try managedContext.fetch(fetchRequest)[0] as! NSManagedObject
            managedContext.delete(dataToDelete)
            try managedContext.save()
        }catch let err{
            print(err)
        }
    }
}
