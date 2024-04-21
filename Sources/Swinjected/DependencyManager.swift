//
//  DependencyManager.swift
//  ListSwiftUI
//
//  Created by Julian Manke on 26.03.24.
//

import Foundation
import SwiftData

/// Collects all dependencies. Define all dependencies to be used across the app in this class.
class DependencyManager {
    private let storage = DependencyStorage.shared

    /// Adds all dependencies to be used in the app. Creare instances within this method.
    func addDependencies(
        modelContainer: ModelContainer,
        modelContext: ModelContext,
        modelActorDB: ModelActorDatabase
    ) {
        storage.add(modelActorDB, for: ModelActorDatabase.self)
        storage.add(TrackingStorage(), for: TrackingStorage.self)
        storage.add(TrackingManager(), for: TrackingManager.self)
        
        storage.add(modelContext, for: ModelContext.self)
        storage.add(modelContainer, for: ModelContainer.self)
        
        storage.add(TeaserStorage(), for: TeaserStorage.self)
        storage.add(TeaserRepository(), for: TeaserRepositoryProviding.self)
        storage.add(NewsTickerStorage(), for: NewsTickerStorage.self)
        storage.add(NewsTickerRepository(), for: NewsTickerRepositoryProviding.self)
        storage.add(SavedStorage(), for: SavedStorage.self)
        storage.add(SavedRepository(), for: SavedRepositoryProviding.self)
        storage.add(UserPredictionRepository(), for: UserPredictionRepositoryProviding.self)
        
        // ViewModel
        storage.add(ShareButton.ViewModel(), for: ShareButton.ViewModel.self)
        storage.add(BookmarkButton.ViewModel(), for: BookmarkButton.ViewModel.self)
    }
    
    /// Creates a model container to be used throughout the app.
    ///
    /// Attention: Make sure that all necessary DB entities are registered here.
    ///
    /// - Returns: Instance of a `ModelContainer`
    @MainActor
    func getModelContainer() -> ModelContainer {
        do {
            return try ModelContainer(for: Teaser.self, NewsTicker.self, SavedArticle.self)
        } catch {
            fatalError()
        }
    }
}

