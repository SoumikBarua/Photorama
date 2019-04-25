# Photorama

This is an iOS app that reads in a list of interesting photos from Flickr using its API.

## Getting Started

This project was created to learn how to make web service requests using **URLSession**, parse JSON data using **JSONSerialization** and implement data persistence using **Core Data** framework. This project also allowed an opportunity to practice implementing segues. 

## App Walkthrough GIF

This GIF shows the app in action.

![Photorama Walkthrough](walkthrough.gif)


## Lessons Learned
1. Web service requests can be done with URL and key-value pairs that are part of the URL's format are called *query items*.
2. Enumerations can have raw values associated with them, which can be of any type like **Int** or **String**.
3. To declare a type-level property or a method in structs, use the **static** keyword. Classes may also use the **class** keyword for type properties and methods.
4. The default level of access control for properties and methods is **internal**. Going from least restrictive to most restrictive, the levels are: **open**, **public**, **internal**, **fileprivate**, and **private**.
5. Computed properties calculate a value instead of storing it. They provide a getter and an optional setter. 
6. **URLRequest** contains the information needed for the web service request. An instance of **URLRequest** can be created with an **URL** object, which in turn can be properly formatted with the help of an **URLComponents** instance.
7. **URLSessionTask** is an abstract class that is responsible for the actual work of communicating with a server. The three types of concrete session tasks are: **URLSessionDataTask** for retrieving data and returning it as **Data** in memory, **URLSessionDownloadTask** for downloading files and **URLSessionUploadTask** for uploading files. To start a task, **.resume()** needs to be called as all tasks are created in a suspended state.
8. **URLSession** serves as a factory for **URLSessionTask** instances. An instance of **URLSession** can create multiple tasks with common properties defined by it's configuration.
9. In JSON documents, curley braces ( { and } ) denote a dictionary while square brackets ( [ and  ] ) denote an array.
10. Enumerations can also have associated values. Associated values in enums can be a great way to handle an operation's, such as a web service request, success or failure; the success case can have data following a successful execution and the failure case can have error info tied to it.
11. It is a good idea to add a completion closure with the **@escaping** annotation to the method where the web service request is taking place. Since getting data from the request will be asynchronous, the closure will be called once the particular instance of **URLSessionTask** completes the request.
12. A **URLSessionDataTask** will run it's completion handler on the background thread. To run any instructions inside the completion handler on the main thread, use **OperationQueue.main.addOperation(_:)** and place such instructions inside it.
13. To refactor the **UICollectionView** and **UITableView** data source methods to a separate class, the class must conform to **NSObjectProtocol** on top of conforming to the respective data source protocol.
14. To customize the layout of a **UICollectionView**, access it's **collectionViewLayout** property as **UICollectionViewFlowLayout** and adjust the properties as needed. Alternatively, the view controller with the collection view can conform to **UICollectionViewDelegateFlowLayout** and implement the optional methods.
15. The method **awakeFromNib()** is called when a cell is first created and **prepareForResuse()** when a cell is about to get reused.
16. The **UIActivityIndicatorView** class can be used to display a spinning wheel for loading content as the user waits.
17. To compare data items in a collection, conform the type of the data to the **Equatable** protocol. For example, conforming to the **Equatable** protcol and implementing **==(_:_:)**  function allows a type to see if two of its instances have equal values.
18. Extensions offer more functionality to a class/type by adding computed properties, adding methods and conforming to protocols. Stores properties, however, cannot be added to extensions.
19. In **Core Data**, a Swift type is called an *entity* and the properties are called *attributes*. If a property's type is not one of the certain data types that **Core Data** can store in its stores, declare that property as a *transformable attribute*. The *attributes* in **Core Data** are also modelled to be optionals.
20. **NSManagedObject** is the default class of an object fetched with **Core Data**.
21. When creating an instance of **NSPersistentContainer**, the name must match the name of the data file model which holds the different entities. After its instantiation, the container needs to load its persistent stores and this operation is an asynchronous one.
22. A **NSPersistentContainer** object's **viewContext** is what allows interaction with the entities in **Core Data**. This **viewContext** property is of type **NSManagedObjectContext**. Use the **performAndWait(_:)** synchronous method to return after its block is executed.
23. Saving in **Core Data** is relatively simple with calling **save()** on the **viewContext** of the **NSPersistentContainer** object. On the other hand, loading/fetching objects back requires executing a **NSFetchRequest**. The **sortDescriptors** property of a **NSFetchRequest** object needs to be supplied an array of **NSSortDescriptor** instances. This **sortDescriptors** property has a key that matches an attribute of the entities to be loaded and a boolean for ascending/descending sorting. The array helps sorting through potential collisions, e.g. people with the same last name could be sorted based on their first names. 
24. A **NSPredicate** object can contain a condition that can be true or false. Such a predicate can be added to a **NSFetchRequest** instance via it's **predicate** property to check if an entity matches a specific criteria.
25. In **Core Data**, entities can have two kinds of relationships: *to-one* and *to-many*. In a *to-many* relationship, an instance of one entity has a reference to a **Set** containing instances of the other entity. Two entities can have a bidirectional relationship with each other, called an *inverse* relationship.
26. Instead of using the **viewContext** of **NSPersistentContainer**, use **performBackgroundTask(_:)** to run expensive operations on the background and avoid blocking the main queue.
