# RealmMigration
Realm Database migration using swift 
Realm Database Migration in Swift
Hello Friend's , I am Narendra Jagne. Today , we are talking about "Realm database migration in swift language for iOS application developments".  Local database is one of the major task in mobile developement. To stored the data locally Apple provided the Coredata and Sqlite DB framework . While importing this two framework you will stored data into your iOS device But ways of this two framework are totally different. Coredata is Object Relational Model , It stored data in the form of objects while in sqlite databse you need to make queries and insert into table. All things are okey while creating table, insert , update and delete but in case of database migration it's going very complex. 
To make developer life easier and speed on work , Realm local database storage is here. I will tell why we use "Realm Databse ".
Realm Database totally free for developer.
Realm Database easy to integrate and easy to use.
Less code and more functionality will done.
You can access all method and class using objects.
Quick access from database.
Real time table will be re-load like pagination.
Realm Database is very lightweighted.
And one of the major part will be done very easily i.e. Database Migration. 

Now, It is very easy to upload your new version to App Store without affecting old version when we used Realm database migration. Just two days before I had done realm database migration into my current project and using realm framework, I Achieved it within the deadline. So, guys In this blog I will discuss following topics.
How to integrate Realm Database.
How to use Realm into your projects.
How to done Realm Database migration.

Let's see in deep all topics one by one.
How to integrate Realm Database
You can integrate realm database two ways into your projects.
A) By drag and drop framework into your projects.
B) By installed pod file of realm framework.
let's see first " By drag and drop framework into your projects".
You can downalod realm database form here "https://github.com/realm/realm-cocoa"
download zip file of realm master and store it locally in your desktop then unzip it and drag realm folder into your project.
Now , we will see other way of integration realm into your projects using cocoapod file.
Prerequisites : 
Building Realm requires Xcode 8.x.
If cloning from git, submodules are required: git submodule update --init --recursive.

Drag and drop ur project directory into terminals 
(drag your project local directory)Now follow the step's below :
run command pod init 
open podfile and insert realm framework and save it.

(podfile view)3. command pod install
(Installing on runnig ..)after installation done open your "RealmDatabseMigration.xcworkspace" file.
Finally integration process is done. Now we will do second step
How to use Realm into your projects : 
Concepts and Classes Overview
To better understand what Realm does, here are some concepts and information about the classes you'll use in this tutorial:
Realm: Realm instances are the heart of the framework. It's your access point to the underlying database like a Core Data managed object context. You create instances using the Realm() initializer.
Object: This is your Realm model. The act of creating a model defines the schema of the database. To create a model, you subclass Object and define the fields you want to persist as properties.
Relationships: You create one-to-many relationships between objects by declaring a property of the type of the Object to which you want to refer. You can create many-to-one and many-to-many relationships via a property of type List.
Write Transactions: Any operations in the database, like creating, editing or deleting objects, must be performed within writes by calling write(_:) on Realminstances.
Queries: To retrieve objects from the database you use queries. The simplest form of a query is calling objects() on a Realm instance and passing in the class of the Object you're looking for. If your data retrieval needs are more complex, you can make use of predicates, chain your queries and order your results.
Results: Results is an auto-updating container type that you get back from object queries. They have many similarities with regular Arrays including the subscript syntax.

With a brief introduction to Realm, it's time to get your feet wet and build the rest of the project.
Your First Model
import Foundation
import RealmSwift
final class NKJagne: Object {
     dynamic var pickUpArea = ""
     dynamic var dropingArea= ""
     dynamic var cab_No = 0
}
Now, add data to locally using realm database 
import UIKit
import Realm
import RealmSwift
// All changes to an object (addition, modification and deletion) must be done within a write transaction.
final class NKJagneLocalStorage {
// MARK: - Properties
static let currentSchemaVersion: UInt64 = 3
// MARK: - Static Methods
static func tripStore() throws {
     let fristTrip = NKJagne()
     fristTrip.pickUpArea = "Thane"
     fristTrip.dropingArea = "Belapur, Navi Mumbai"
     fristTrip.cab_No = 9089
     let secondTrip = NKJagne()
     secondTrip.pickUpArea = "Dadar"
     secondTrip.dropingArea = "Goregaon"
     secondTrip.cab_No = 7845
     let thirdTrip = NKJagne()
     thirdTrip.pickUpArea = "Bandra"
     thirdTrip.dropingArea = "Churchget"
     thirdTrip.cab_No = 6756
     let fourthTrip = NKJagne()
     fourthTrip.pickUpArea = "Chembur"
     fourthTrip.dropingArea = "Andheri"
     fourthTrip.cab_No = 3450
     let realm = try Realm()
     try realm.write {
          realm.add([fristTrip, secondTrip, thirdTrip, fourthTrip]
      }
    }
}
Finally call tripStore() method to viewdidload of viewcontroller class.like NKJagneLocalStorage.tripStore()
In this way , you are able store data locally using realm framework.Now we will jump to database migration. how realm database migration done i will describe below.
How to done Realm Database migration ?
Migration is very simple using realm database . First you need to declared new property which you want add to exit database. see below syntax
import UIKit
import Foundation
import RealmSwift
final class NKJagne: Object {
/* old version database properties */
     dynamic var pickUpArea = ""
     dynamic var dropingArea = ""
     dynamic var cab_No = 0
/* in new version , you need to add one new properties */
     dynamic var tripType = ""
}
Now , you added new property successfully and you need to add migration method to NKJagneLocalStorage medule
import UIKit
import Realm
import RealmSwift
// All changes to an object (addition, modification and deletion) must be done within a write transaction.
final class NKJagneLocalStorage {
// MARK: - Properties
static let currentSchemaVersion: UInt64 = 3
// MARK: - Static Methods
static func tripStore() throws {
   
   let fristTrip = NKJagne()
   fristTrip.pickUpArea = "Thane"
   fristTrip.dropingArea = "Belapur, Navi Mumbai"
   fristTrip.cab_No = 9089
   let secondTrip = NKJagne()
   secondTrip.pickUpArea = "Dadar"
   secondTrip.dropingArea = "Goregaon"
   secondTrip.cab_No = 7845
   let thirdTrip = NKJagne()
   thirdTrip.pickUpArea = "Bandra"
   thirdTrip.dropingArea = "Churchget"
   thirdTrip.cab_No = 6756
   let fourthTrip = NKJagne()
   fourthTrip.pickUpArea = "Chembur"
   fourthTrip.dropingArea = "Andheri"
   fourthTrip.cab_No = 3450
   let realm = try Realm()
   try realm.write {
       realm.add([fristTrip, secondTrip, thirdTrip, fourthTrip]
     }
  }
static func configureMigration() {
    let config = Realm.Configuration(schemaVersion:             currentSchemaVersion, migrationBlock: { (migration, oldSchemaVersion) in
        if oldSchemaVersion < 1 {
            migrateFrom0To1(with: migration)
        }
     })
    Realm.Configuration.defaultConfiguration = config
}
// MARK: - Migrations
static func migrateFrom0To1(with migration: Migration) {
// Add an tripType property
           migration.enumerateObjects(ofType: NKJagne.className()) {  (_, newNKJagne) in
                   newNKJagne?["tripType"] = ""
                }
             }
      }
Migration method implemented and now we need to call this migration method to appdelegate class.
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       // Override point for customization after application launch.
      // realm migration configure
      NKJagneLocalStorage.configureMigration()
      return true
     }
}
Uhhhhhreeee…Finally we acheived database migration using realm framework . see now how easy it is . it make developer life more easy :-) 
Thanks to Realm team to save lots more time.
Conclusion
My litle advice to all iOS developer once you try realm you will really findout. It is very easy to use in our ios application. Realm is very lightweight framework and easy to integrated.
for realm database migration blog please please visit my blog into https://medium.com/@nkjagne1

you can also visit my linkedin profile "https://www.linkedin.com/in/narendra-jagne-6b32aab4/"
If you like this blog please give some claps and fellow me and give me your feedback it will really helpfull for me.
iCoder on implementation :-)
