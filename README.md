# What is Swinject?
Swinject is a lightweight essy to use dependency injection (DI) Swift Package for iOS, that makes use of Property Wrappers to inject dependencies using `@Injected var dependency: DependencyType`. Every time you use your dependency, Swinject guarantees to always use one single instance of your dependeny throughout your app.

# How to install
## Swift Package Manager
In Xcode navigate to File -> Add Package Dependencies and enter the url: `https://github.com/JManke91/Swinjected.git`

# How to use?
## Setup Dependencies
At the entry point of your app (YourAppNameApp.swift) maake sure to `import Swinjected` and create an instance of the `DependencyManager`:
```
let dependencyManager = DependencyManager()
```
and add any dependency you would like to use, e.g. `MyDependency: MyDependencyProviding` to the `DependencyManager` using
```
dependencyManager.addDependency(MyDependency(), for: MyDependencyProviding.self)
```
That's it for the setup.

## Use Dependencies
In any file you want to use one of your previously registered dependencies, simply `import Swinjected` and 
```
@Injected var myDependency: MyDependencyProviding
```
and your dependeny is ready to be used.
