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
and add any dependency you would like to use, e.g. `MyDependency: MyDependencyProviding` to the `DependencyManager`. Depending on, if the dependency should be a unique single instance, or a Transient instance, that is created every time the dependency is resolved, you choose to register the dependencies either using
```
dependencyManager.addDependency(MyDependency(), for: MyDependencyProviding.self)
```
for singleton usage, or
```
dependencyManager.addFactory(MyDependency.init, for: MyDependency.self)
```
for Transient dependencies. Attention: If the dependencies depend on each other, the order of dependency registration is important, otherwise they cannot be resolved properly.

## Use Dependencies
In any file you want to use one of your previously registered dependencies, simply `import Swinjected` and 
```
@Injected var myDependency: MyDependencyProviding
```
and your dependeny is ready to be used.

# What's still missing
Currently the user has to be aware of the dependency tree when using the `DependencyManager` to register dependencies using `addDependency`. That means if dependency A is regisered before dependency B, while A is dependent on B, the app will crash because when resolving at runtime, the dependency B cannot be resolved as it has not been registered yet.
